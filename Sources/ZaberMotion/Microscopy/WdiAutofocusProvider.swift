﻿// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Dto
import DtoRequests
import ZaberMotionExceptions
import Gateway
import ZaberMotionAscii
import Utils

/**
 Class representing access to WDI Autofocus connection.
 */
public final class WdiAutofocusProvider: @unchecked Sendable  {

    public init(providerId: Int) {
        self.providerId = providerId
    }

    /**
     Default port number for TCP connections to WDI autofocus.
     */
    public static let defaultTcpPort: Int = 27;

    /**
     The ID identifies the autofocus with the underlying library.
     */
    public let providerId: Int

    /**
     Opens a TCP connection to WDI autofocus.

     - Parameters:
        - hostName: Hostname or IP address.
        - port: Optional port number (defaults to 27).

     - Returns: An object representing the autofocus connection.
     */
    public static func openTcp(hostName: String, port: Int = WdiAutofocusProvider.defaultTcpPort) async throws -> WdiAutofocusProvider {
        _assertSendable(WdiAutofocusProvider.self)

        var request = DtoRequests.OpenInterfaceRequest()
        request.interfaceType = DtoRequests.InterfaceType.tcp
        request.hostName = hostName
        request.port = port

        let response = try await Gateway.callAsync("wdi/open", request, DtoRequests.IntResponse.fromByteArray)
        return WdiAutofocusProvider(providerId: response.value)
    }

    /**
     Close the connection.
     */
    public func close() async throws  {
        var request = DtoRequests.InterfaceEmptyRequest()
        request.interfaceId = self.providerId

        try await Gateway.callAsync("wdi/close", request)
    }

    /**
     Generic read operation.

     - Parameters:
        - registerId: Register address to read from.
        - size: Data size to read. Valid values are (1,2,4). Determines the data type (Byte, Word, DWord).
        - count: Number of values to read (defaults to 1).
        - offset: Offset within the register (defaults to 0).
        - registerBank: Register bank letter (defaults to U for user bank).

     - Returns: Array of integers read from the device.
     */
    public func genericRead(registerId: Int, size: Int, count: Int = 1, offset: Int = 0, registerBank: String = "U") async throws -> [Int] {
        var request = DtoRequests.WdiGenericRequest()
        request.interfaceId = self.providerId
        request.registerId = registerId
        request.size = size
        request.count = count
        request.offset = offset
        request.registerBank = registerBank

        let response = try await Gateway.callAsync("wdi/read", request, DtoRequests.IntArrayResponse.fromByteArray)
        return response.values
    }

    /**
     Generic write operation.

     - Parameters:
        - registerId: Register address to read from.
        - size: Data size to write. Valid values are (0,1,2,4). Determines the data type (Nil, Byte, Word, DWord).
        - data: Array of values to write to the register. Empty array is allowed.
        - offset: Offset within the register (defaults to 0).
        - registerBank: Register bank letter (defaults to U for user bank).
     */
    public func genericWrite(registerId: Int, size: Int = 0, data: [Int] = [], offset: Int = 0, registerBank: String = "U") async throws  {
        var request = DtoRequests.WdiGenericRequest()
        request.interfaceId = self.providerId
        request.registerId = registerId
        request.size = size
        request.data = data
        request.offset = offset
        request.registerBank = registerBank

        try await Gateway.callAsync("wdi/write", request)
    }

    /**
     Enables the laser.
     */
    public func enableLaser() async throws  {
        var request = DtoRequests.WdiGenericRequest()
        request.interfaceId = self.providerId
        request.registerId = 1

        try await Gateway.callAsync("wdi/write", request)
    }

    /**
     Disables the laser.
     */
    public func disableLaser() async throws  {
        var request = DtoRequests.WdiGenericRequest()
        request.interfaceId = self.providerId
        request.registerId = 2

        try await Gateway.callAsync("wdi/write", request)
    }

    /**
     Gets the status of the autofocus.

     - Returns: The status of the autofocus.
     */
    public func getStatus() async throws -> WdiAutofocusProviderStatus {
        _assertSendable(WdiAutofocusProviderStatus.self)

        var request = DtoRequests.InterfaceEmptyRequest()
        request.interfaceId = self.providerId

        let response = try await Gateway.callAsync("wdi/get_status", request, DtoRequests.WdiGetStatusResponse.fromByteArray)
        return response.status
    }

    /**
     Returns a string that represents the autofocus connection.

     - Returns: A string that represents the connection.
     */
    public func toString() throws -> String {
        var request = DtoRequests.InterfaceEmptyRequest()
        request.interfaceId = self.providerId

        let response = try Gateway.callSync("wdi/to_string", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

}
