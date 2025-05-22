import DtoRequests
import DtoSerializable
import ZaberMotionExceptions
import Foundation
import ZaberMotionCore

enum GatewayError: Error {
    case invalidReturnCode(Int32)
}

typealias CallbackFn = @convention(c) (UnsafeMutableRawPointer, Int64) -> Void

let GO_SYNC: UInt8 = 0
let GO_ASYNC: UInt8 = 1

func handleException(_ gatewayResponse: GatewayResponse, _ responses: [Data]) throws {
    guard gatewayResponse.response != ResponseType.ok else {
        return
    }

    if responses.count > 1 {
        throw try ExceptionConverter.convert(
            error: gatewayResponse.errorType,
            message: gatewayResponse.errorMessage,
            customData: responses[1]
        )
    } else {
        throw try ExceptionConverter.convert(
            error: gatewayResponse.errorType,
            message: gatewayResponse.errorMessage
        )
    }
}

func parseResponse<T>(_ responses: [Data], _ responseParser: (Data) throws -> T) throws -> T {
    let gatewayResponse = try GatewayResponse.fromByteArray(responses[0])
    try handleException(gatewayResponse, responses)

    guard responses.count > 1 else {
        throw LibraryIntegrationException(message: "No response from library!")
    }

    return try responseParser(responses[1])
}

func parseResponse(_ responses: [Data]) throws {
    let gatewayResponse = try GatewayResponse.fromByteArray(responses[0])
    try handleException(gatewayResponse, responses)

    guard responses.count == 1 else {
        throw LibraryIntegrationException(message: "Expected no response but got response!")
    }
}

// SYNC

class GatewayContextSync {
    var responseData: [Data] = []
}

let gatewayCallbackSync: CallbackFn = { (rawResponse: UnsafeMutableRawPointer, tag: Int64) in
    let responseData = deserialize(rawResponse)
    let ptr = UnsafeRawPointer(bitPattern: Int(tag))
    let gatewayContext = Unmanaged<GatewayContextSync>.fromOpaque(ptr!).takeUnretainedValue()
    gatewayContext.responseData = responseData
}

private func callGatewaySyncInternal(_ request: String, _ requestData: (any Serializable)?) throws
    -> [Data]
{
    Events.shared.ensureInitialized()

    let request = GatewayRequest(request: request)
    let requests = requestData == nil ? [request] : [request, requestData!]
    let buffer = try serialize(requests)
    let gatewayContext = GatewayContextSync()

    try buffer.withUnsafeBytes { bytes in
        let pointer: UnsafeRawPointer = bytes.baseAddress!
        let callbackPtr: UnsafeMutableRawPointer = unsafeBitCast(
            gatewayCallbackSync, to: UnsafeMutableRawPointer.self)

        let contextPtr = Unmanaged.passUnretained(gatewayContext).toOpaque()
        let contextTag = Int64(Int(bitPattern: contextPtr))

        // GoInt32 zml_call(void* request, GoInt64 tag, void* callback, GoUint8 async);
        let result = ZaberMotionCore.zml_call(
            UnsafeMutableRawPointer(mutating: pointer), contextTag, callbackPtr, GO_SYNC)
        if result != 0 {
            throw GatewayError.invalidReturnCode(result)
        }
    }
    return gatewayContext.responseData
}

public func callSync<T>(
    _ request: String, _ requestData: (any Serializable)?, _ responseParser: (Data) throws -> T
) throws -> T {
    let data = try callGatewaySyncInternal(request, requestData)
    return try parseResponse(data, responseParser)
}

public func callSync(_ request: String, _ requestData: (any Serializable)? = nil) throws {
    let data = try callGatewaySyncInternal(request, requestData)
    try parseResponse(data)
}

// ASYNC

class GatewayContextAsync {
    var continuation: CheckedContinuation<[Data], Error>? = nil
}

let gatewayCallbackAsync: CallbackFn = { (rawResponse: UnsafeMutableRawPointer, tag: Int64) in
    let ptr = UnsafeRawPointer(bitPattern: Int(tag))
    let gatewayContext = Unmanaged<GatewayContextAsync>.fromOpaque(ptr!).takeUnretainedValue()
    let responses = deserialize(rawResponse)
    gatewayContext.continuation!.resume(returning: responses)
}

private func callGatewayAsyncInternal(_ request: String, _ requestData: (any Serializable)?)
    async throws -> [Data]
{
    Events.shared.ensureInitialized()

    let gatewayRequest = GatewayRequest(request: request)
    let requests = requestData == nil ? [gatewayRequest] : [gatewayRequest, requestData!]
    let buffer = try serialize(requests)
    let gatewayContext = GatewayContextAsync()

    return try await withCheckedThrowingContinuation { continuation in
        gatewayContext.continuation = continuation
        let contextPtr = Unmanaged.passUnretained(gatewayContext).toOpaque()
        let contextTag = Int64(Int(bitPattern: contextPtr))

        buffer.withUnsafeBytes { bytes in
            let pointer = UnsafeMutableRawPointer(mutating: bytes.baseAddress!)
            let callbackPtr = unsafeBitCast(gatewayCallbackAsync, to: UnsafeMutableRawPointer.self)

            // GoInt32 zml_call(void* request, GoInt64 tag, void* callback, GoUint8 async);
            let result = ZaberMotionCore.zml_call(pointer, contextTag, callbackPtr, GO_ASYNC)
            if result != 0 {
                // Currently zml_call only ever returns 0, but the other languages all handle this case
                // so it seemed important to do. That said, it's not guaranteed that callbackPtr will NOT be
                // called in the case of an error, so it's possible that the continuation will be resumed twice,
                // once in the callback and once here. This is a potential bug, and must be considered when
                // implementing error code handling on the GO side if / when that ever happens.

                continuation.resume(throwing: GatewayError.invalidReturnCode(result))
            }
        }
    }
}

public func callAsync(_ request: String, _ requestData: (any Serializable)? = nil) async throws {
    let data = try await callGatewayAsyncInternal(request, requestData)
    try parseResponse(data)
}

public func callAsync<T>(
    _ request: String, _ requestData: (any Serializable)?, _ responseParser: (Data) throws -> T
) async throws -> T {
    let data = try await callGatewayAsyncInternal(request, requestData)
    return try parseResponse(data, responseParser)
}
