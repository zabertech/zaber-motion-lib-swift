﻿// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Combine
import Foundation
import DtoRequests
import DtoBinary
import Gateway
import ZaberMotionExceptions
import Utils

/**
 Module: ZaberMotionBinary

 Class representing access to particular connection (serial port, TCP connection) using the legacy Binary protocol.
 */
public final class Connection: @unchecked Sendable {

    package init(interfaceId: Int) {
        self.interfaceId = interfaceId
        subscribe()
    }

    /**
     Module: ZaberMotionBinary

     Default baud rate for serial connections.
     */
    public static let defaultBaudRate: Int = 9600;

    /**
     Module: ZaberMotionBinary

     The interface ID identifies thisConnection instance with the underlying library.
     */
    public let interfaceId: Int

    /**
     Module: ZaberMotionBinary

     Returns whether the connection is open.
     Does not guarantee that the subsequent requests will succeed.
     */
    public var isOpen: Bool {
        get throws { return try retrieveIsOpen() }
    }

    /**
     Module: ZaberMotionBinary

     Opens a serial port.

     - Parameters:
        - portName: Name of the port to open.
        - baudRate: Optional baud rate (defaults to 9600).
        - useMessageIds: Enable use of message IDs (defaults to disabled).
          All your devices must be pre-configured to match.

     - Returns: An object representing the port.
     */
    public static func openSerialPort(portName: String, baudRate: Int = Connection.defaultBaudRate, useMessageIds: Bool = false) async throws -> Connection {
        _assertSendable(Connection.self)

        var request = DtoRequests.OpenBinaryInterfaceRequest()
        request.interfaceType = DtoRequests.InterfaceType.serialPort
        request.portName = portName
        request.baudRate = baudRate
        request.useMessageIds = useMessageIds

        let response = try await Gateway.callAsync("binary/interface/open", request, DtoRequests.OpenInterfaceResponse.fromByteArray)
        return Connection(interfaceId: response.interfaceId)
    }

    /**
     Module: ZaberMotionBinary

     Opens a TCP connection.

     - Parameters:
        - hostName: Hostname or IP address.
        - port: Port number.
        - useMessageIds: Enable use of message IDs (defaults to disabled).
          All your devices must be pre-configured to match.

     - Returns: An object representing the connection.
     */
    public static func openTcp(hostName: String, port: Int, useMessageIds: Bool = false) async throws -> Connection {
        _assertSendable(Connection.self)

        var request = DtoRequests.OpenBinaryInterfaceRequest()
        request.interfaceType = DtoRequests.InterfaceType.tcp
        request.hostName = hostName
        request.port = port
        request.useMessageIds = useMessageIds

        let response = try await Gateway.callAsync("binary/interface/open", request, DtoRequests.OpenInterfaceResponse.fromByteArray)
        return Connection(interfaceId: response.interfaceId)
    }

    /**
     Module: ZaberMotionBinary

     Close the connection.
     */
    public func close() async throws  {
        var request = DtoRequests.InterfaceEmptyRequest()
        request.interfaceId = self.interfaceId

        try await Gateway.callAsync("interface/close", request)
    }

    /**
     Module: ZaberMotionBinary

     Sends a generic Binary command to this connection.
     For more information please refer to the
     [Binary Protocol Manual](https://www.zaber.com/protocol-manual?protocol=Binary#topic_quick_command_reference).

     - Parameters:
        - device: Device address to send the command to. Use zero for broadcast.
        - command: Command to send.
        - data: Optional data argument to the command. Defaults to zero.
        - timeout: Number of seconds to wait for a response from the device. 0 or negative defaults to 0.5s.
        - checkErrors: Controls whether to throw an exception when the device rejects the command.

     - Returns: A response to the command.
     */
    public func genericCommand(device: Int, command: CommandCode, data: Int = 0, timeout: Double = 0.0, checkErrors: Bool = true) async throws -> Message {
        _assertSendable(Message.self)

        var request = DtoRequests.GenericBinaryRequest()
        request.interfaceId = self.interfaceId
        request.device = device
        request.command = command
        request.data = data
        request.timeout = timeout
        request.checkErrors = checkErrors

        let response = try await Gateway.callAsync("binary/interface/generic_command", request, Message.fromByteArray)
        return response
    }

    /**
     Module: ZaberMotionBinary

     Sends a generic Binary command to this connection without expecting a response.
     For more information please refer to the
     [Binary Protocol Manual](https://www.zaber.com/protocol-manual?protocol=Binary#topic_quick_command_reference).

     - Parameters:
        - device: Device address to send the command to. Use zero for broadcast.
        - command: Command to send.
        - data: Optional data argument to the command. Defaults to zero.
     */
    public func genericCommandNoResponse(device: Int, command: CommandCode, data: Int = 0) async throws  {
        var request = DtoRequests.GenericBinaryRequest()
        request.interfaceId = self.interfaceId
        request.device = device
        request.command = command
        request.data = data

        try await Gateway.callAsync("binary/interface/generic_command_no_response", request)
    }

    /**
     Module: ZaberMotionBinary

     Sends a generic Binary command to this connection and expects responses from one or more devices.
     Responses are returned in order of arrival.
     For more information please refer to the
     [Binary Protocol Manual](https://www.zaber.com/protocol-manual?protocol=Binary#topic_quick_command_reference).

     - Parameters:
        - command: Command to send.
        - data: Optional data argument to the command. Defaults to zero.
        - timeout: Number of seconds to wait for all responses from the device chain. 0 or negative defaults to 0.5s.
        - checkErrors: Controls whether to throw an exception when any device rejects the command.

     - Returns: All responses to the command.
     */
    public func genericCommandMultiResponse(command: CommandCode, data: Int = 0, timeout: Double = 0.0, checkErrors: Bool = true) async throws -> [Message] {
        _assertSendable(Message.self)

        var request = DtoRequests.GenericBinaryRequest()
        request.interfaceId = self.interfaceId
        request.command = command
        request.data = data
        request.timeout = timeout
        request.checkErrors = checkErrors

        let response = try await Gateway.callAsync("binary/interface/generic_command_multi_response", request, DtoRequests.BinaryMessageCollection.fromByteArray)
        return response.messages
    }

    /**
     Module: ZaberMotionBinary

     Renumbers devices present on this connection. After renumbering, you must identify devices again.

     - Returns: Total number of devices that responded to the renumber.
     */
    public func renumberDevices() async throws -> Int {
        var request = DtoRequests.InterfaceEmptyRequest()
        request.interfaceId = self.interfaceId

        let response = try await Gateway.callAsync("binary/device/renumber", request, DtoRequests.IntResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionBinary

     Attempts to detect any devices present on this connection.

     - Parameters:
        - identifyDevices: Determines whether device identification should be performed as well.

     - Returns: Array of detected devices.
     */
    public func detectDevices(identifyDevices: Bool = true) async throws -> [Device] {
        _assertSendable(Device.self)

        var request = DtoRequests.BinaryDeviceDetectRequest()
        request.interfaceId = self.interfaceId
        request.identifyDevices = identifyDevices

        let response = try await Gateway.callAsync("binary/device/detect", request, DtoRequests.BinaryDeviceDetectResponse.fromByteArray)
        return try response.devices.map { try getDevice(deviceAddress: $0) }
    }

    /**
     Module: ZaberMotionBinary

     Gets a Device class instance which allows you to control a particular device on this connection.
     Devices are numbered from 1.

     - Parameters:
        - deviceAddress: Address of device intended to control. Address is configured for each device.

     - Returns: Device instance.
     */
    public func getDevice(deviceAddress: Int) throws -> Device {
        guard deviceAddress > 0 else {
            throw ZaberMotionExceptions.InvalidArgumentException(message: "Invalid value; physical devices are numbered from 1.")
        }

        return Device(connection: self, deviceAddress: deviceAddress)
    }

    /**
     Module: ZaberMotionBinary

     Returns a string that represents the connection.

     - Returns: A string that represents the connection.
     */
    public func toString() throws -> String {
        var request = DtoRequests.InterfaceEmptyRequest()
        request.interfaceId = self.interfaceId

        let response = try Gateway.callSync("interface/to_string", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionBinary

     Releases native resources of the connection.

     - Parameters:
        - interfaceId: The ID of the connection.
     */
    static func free(interfaceId: Int) throws  {
        var request = DtoRequests.InterfaceEmptyRequest()
        request.interfaceId = interfaceId

        try Gateway.callSync("interface/free", request)
    }

    /**
     Module: ZaberMotionBinary

     Returns is open.

     - Returns: Is open.
     */
    func retrieveIsOpen() throws -> Bool {
        var request = DtoRequests.InterfaceEmptyRequest()
        request.interfaceId = self.interfaceId

        let response = try Gateway.callSync("interface/get_is_open", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }


    /**
     Module: ZaberMotionBinary
     Close the connection synchronously.
     */
    public func closeSync() throws  {
        var request = DtoRequests.InterfaceEmptyRequest()
        request.interfaceId = self.interfaceId

        try Gateway.callSync("interface/close", request)
    }

    deinit {
        guard interfaceId >= 0 else { return }

        do {
            try self.closeSync()
        } catch let e as MotionLibException {
            fputs("ZML Error \(e.toString())", stderr)
        } catch {
            fputs("System Error: \(error)", stderr)
        }

        do {
            try Connection.free(interfaceId: self.interfaceId)
        } catch let e as MotionLibException {
            fputs("ZML Error: \(e.toString())", stderr)
        } catch {
            fputs("System Error: \(error)", stderr)
        }
    }

    /**
     Subscribe to all events.
    */
    private func subscribe() {
        self._disconnected = Events.shared.disconnected.filter {
                disconnectedEvent in
                return disconnectedEvent.interfaceId == self.interfaceId
            }.map { disconnectedEvent in
                do {
                    return try ExceptionConverter.convert(
                        error: disconnectedEvent.errorType,
                        message: disconnectedEvent.errorMessage
                    )
                } catch {
                    return InternalErrorException(message: "Failed to convert disconnected event: \(error)")
                }
            }.first()
            .eraseToAnyPublisher()
            .share()

        self._replyOnly = Events.shared.binaryReplyOnly.prefix(
                untilOutputFrom: self._disconnected!
            ).filter {
                binaryReplyOnlyEventWrapper in
                return binaryReplyOnlyEventWrapper.interfaceId == self.interfaceId
            }.map {
                binaryReplyOnlyEventWrapper in
                return binaryReplyOnlyEventWrapper.reply
            }.eraseToAnyPublisher()
            .share()

        self._unknownResponse = Events.shared.unknownResponseBinary.prefix(
                untilOutputFrom: self._disconnected!
            ).filter {
                unknownBinaryResponseEventWrapper in
                return unknownBinaryResponseEventWrapper.interfaceId == self.interfaceId
            }.map {
                unknownBinaryResponseEventWrapper in
                return unknownBinaryResponseEventWrapper.unknownResponse
            }.eraseToAnyPublisher()
            .share()
    }

    private var _disconnected: Publishers.Share<AnyPublisher<MotionLibException, Never>>?
    /**
     Module: ZaberMotionBinary

     Event invoked when connection is interrupted or closed.
     */
    public var disconnected: Publishers.Share<AnyPublisher<MotionLibException, Never>> {
        return _disconnected!
    }

    private var _replyOnly: Publishers.Share<AnyPublisher<ReplyOnlyEvent, Never>>?
            /**
     Module: ZaberMotionBinary

     Event invoked when a reply-only command such as a move tracking message is received from a device.
     */
    public var replyOnly: Publishers.Share<AnyPublisher<ReplyOnlyEvent, Never>> {
        return _replyOnly!
    }

    private var _unknownResponse: Publishers.Share<AnyPublisher<UnknownResponseEvent, Never>>?
            /**
     Module: ZaberMotionBinary

     Event invoked when a response from a device cannot be matched to any known request.
     */
    public var unknownResponse: Publishers.Share<AnyPublisher<UnknownResponseEvent, Never>> {
        return _unknownResponse!
    }
}
