// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Combine
import Darwin
import Foundation
import DtoRequests
import DtoAscii
import Gateway
import ZaberMotionExceptions
import Utils

/**
 Module: ZaberMotionAscii

 Class representing access to particular connection (serial port, TCP connection).
 */
public final class Connection: @unchecked Sendable {

    package init(interfaceId: Int) {
        self.interfaceId = interfaceId
        ensureSubscribed()
    }

    /**
     Module: ZaberMotionAscii

     Default baud rate for serial connections.
     */
    public static let defaultBaudRate: Int = 115200;

    /**
     Module: ZaberMotionAscii

     Commands sent over this port are forwarded to the device chain.
     The bandwidth may be limited as the commands are forwarded over a serial connection.
     */
    public static let tcpPortChain: Int = 55550;

    /**
     Module: ZaberMotionAscii

     Local area network share port.
     */
    public static let networkSharePort: Int = 11421;

    /**
     Module: ZaberMotionAscii

     Commands send over this port are processed only by the device
     and not forwarded to the rest of the chain.
     Using this port typically makes the communication faster.
     */
    public static let tcpPortDeviceOnly: Int = 55551;

    /**
     Module: ZaberMotionAscii

     The interface ID identifies this Connection instance with the underlying library.
     */
    public let interfaceId: Int

    /**
     Module: ZaberMotionAscii

     The default timeout, in milliseconds, for a device to respond to a request.
     Setting the timeout to a too low value may cause request timeout exceptions.
     The initial value is 1000 (one second).
     */
    public func getDefaultRequestTimeout() throws -> Int {
        return try retrieveTimeout()
    }

    /**
     Module: ZaberMotionAscii

     The default timeout, in milliseconds, for a device to respond to a request.
     Setting the timeout to a too low value may cause request timeout exceptions.
     The initial value is 1000 (one second).
     */
    public func setDefaultRequestTimeout(_ value: Int) throws {
        try changeTimeout(timeout: value)
    }

    /**
     Module: ZaberMotionAscii

     Controls whether outgoing messages contain checksum.
     */
    public func getChecksumEnabled() throws -> Bool {
        return try retrieveChecksumEnabled()
    }

    /**
     Module: ZaberMotionAscii

     Controls whether outgoing messages contain checksum.
     */
    public func setChecksumEnabled(_ value: Bool) throws {
        try changeChecksumEnabled(isEnabled: value)
    }

    /**
     Module: ZaberMotionAscii

     Opens a serial port, if Zaber Launcher controls the port, the port will be opened through Zaber Launcher.
     Zaber Launcher allows sharing of the port between multiple applications,
     If port sharing is not desirable, use the `direct` parameter.

     - Parameters:
        - portName: Name of the port to open.
        - baudRate: Optional baud rate (defaults to 115200).
        - direct: If true will connect to the serial port directly,
          failing if the connection is already opened by a message router instance.

     - Returns: An object representing the port.
     */
    public static func openSerialPort(portName: String, baudRate: Int = Connection.defaultBaudRate, direct: Bool = false) async throws -> Connection {
        _assertSendable(Connection.self)

        var request = DtoRequests.OpenInterfaceRequest()
        request.interfaceType = InterfaceType.serialPort
        request.portName = portName
        request.baudRate = baudRate
        request.rejectRoutedConnection = direct

        let response = try await Gateway.callAsync("interface/open", request, DtoRequests.OpenInterfaceResponse.fromByteArray)
        return Connection(interfaceId: response.interfaceId)
    }

    /**
     Module: ZaberMotionAscii

     Opens a TCP connection.

     - Parameters:
        - hostName: Hostname or IP address.
        - port: Optional port number (defaults to 55550).

     - Returns: An object representing the connection.
     */
    public static func openTcp(hostName: String, port: Int = Connection.tcpPortChain) async throws -> Connection {
        _assertSendable(Connection.self)

        var request = DtoRequests.OpenInterfaceRequest()
        request.interfaceType = DtoRequests.InterfaceType.tcp
        request.hostName = hostName
        request.port = port

        let response = try await Gateway.callAsync("interface/open", request, DtoRequests.OpenInterfaceResponse.fromByteArray)
        return Connection(interfaceId: response.interfaceId)
    }

    /**
     Module: ZaberMotionAscii

     Opens a connection using a custom transport.

     - Parameters:
        - transport: The custom connection transport.

     - Returns: An object representing the connection.
     */
    public static func openCustom(transport: Transport) async throws -> Connection {
        _assertSendable(Connection.self)

        var request = DtoRequests.OpenInterfaceRequest()
        request.interfaceType = DtoRequests.InterfaceType.custom
        request.transport = transport.transportId

        let response = try await Gateway.callAsync("interface/open", request, DtoRequests.OpenInterfaceResponse.fromByteArray)
        return Connection(interfaceId: response.interfaceId)
    }

    /**
     Module: ZaberMotionAscii

     Opens a secured connection to a cloud connected device chain.
     Use this method to connect to devices on your account.

     - Parameters:
        - cloudId: The cloud ID to connect to.
        - token: The token to authenticate with. By default the connection will be unauthenticated.
        - connectionName: The name of the connection to open.
          Can be left empty to default to the only connection present.
          Otherwise, use serial port name for serial port connection or hostname:port for TCP connection.
        - realm: The realm to connect to.
          Can be left empty for the default account realm.
        - api: The URL of the API to receive connection info from.

     - Returns: An object representing the connection.
     */
    public static func openIot(cloudId: String, token: String = "unauthenticated", connectionName: String? = nil, realm: String? = nil, api: String = "https://api.zaber.io") async throws -> Connection {
        _assertSendable(Connection.self)

        var request = DtoRequests.OpenInterfaceRequest()
        request.interfaceType = DtoRequests.InterfaceType.iot
        request.cloudId = cloudId
        request.token = token
        request.connectionName = connectionName
        request.realm = realm
        request.api = api

        let response = try await Gateway.callAsync("interface/open", request, DtoRequests.OpenInterfaceResponse.fromByteArray)
        return Connection(interfaceId: response.interfaceId)
    }

    /**
     Module: ZaberMotionAscii

     Opens a connection to Zaber Launcher in your Local Area Network.
     The connection is not secured.

     - Parameters:
        - hostName: Hostname or IP address.
        - port: Port number.
        - connectionName: The name of the connection to open.
          Can be left empty to default to the only connection present.
          Otherwise, use serial port name for serial port connection or hostname:port for TCP connection.

     - Returns: An object representing the connection.
     */
    public static func openNetworkShare(hostName: String, port: Int = Connection.networkSharePort, connectionName: String? = nil) async throws -> Connection {
        _assertSendable(Connection.self)

        var request = DtoRequests.OpenInterfaceRequest()
        request.interfaceType = DtoRequests.InterfaceType.networkShare
        request.hostName = hostName
        request.port = port
        request.connectionName = connectionName

        let response = try await Gateway.callAsync("interface/open", request, DtoRequests.OpenInterfaceResponse.fromByteArray)
        return Connection(interfaceId: response.interfaceId)
    }

    /**
     Module: ZaberMotionAscii

     Sends a generic ASCII command to this connection.
     For more information refer to the [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_commands).

     - Parameters:
        - command: Command and its parameters.
        - device: Optional device address to send the command to.
        - axis: Optional axis number to send the command to.
        - checkErrors: Controls whether to throw an exception when the device rejects the command.
        - timeout: The timeout, in milliseconds, for a device to respond to the command.
          Overrides the connection default request timeout.

     - Returns: A response to the command.
     */
    public func genericCommand(command: String, device: Int = 0, axis: Int = 0, checkErrors: Bool = true, timeout: Int = 0) async throws -> Response {
        _assertSendable(Response.self)

        var request = DtoRequests.GenericCommandRequest()
        request.interfaceId = self.interfaceId
        request.command = command
        request.device = device
        request.axis = axis
        request.checkErrors = checkErrors
        request.timeout = timeout

        return try await Gateway.callAsync("interface/generic_command", request, Response.fromByteArray)
    }

    /**
     Module: ZaberMotionAscii

     Sends a generic ASCII command to this connection without expecting a response and without adding a message ID.
     For more information refer to the [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_commands).

     - Parameters:
        - command: Command and its parameters.
        - device: Optional device address to send the command to.
          Specifying -1 omits the number completely.
        - axis: Optional axis number to send the command to.
          Specifying -1 omits the number completely.
     */
    public func genericCommandNoResponse(command: String, device: Int = 0, axis: Int = 0) async throws  {
        var request = DtoRequests.GenericCommandRequest()
        request.interfaceId = self.interfaceId
        request.command = command
        request.device = device
        request.axis = axis

        try await Gateway.callAsync("interface/generic_command_no_response", request)
    }

    /**
     Module: ZaberMotionAscii

     Sends a generic ASCII command to this connection and expect multiple responses,
     either from one device or from many devices.
     Responses are returned in order of arrival.
     For more information refer to the [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_commands).

     - Parameters:
        - command: Command and its parameters.
        - device: Optional device address to send the command to.
        - axis: Optional axis number to send the command to.
        - checkErrors: Controls whether to throw an exception when a device rejects the command.
        - timeout: The timeout, in milliseconds, for a device to respond to the command.
          Overrides the connection default request timeout.

     - Returns: All responses to the command.
     */
    public func genericCommandMultiResponse(command: String, device: Int = 0, axis: Int = 0, checkErrors: Bool = true, timeout: Int = 0) async throws -> [Response] {
        _assertSendable(Response.self)

        var request = DtoRequests.GenericCommandRequest()
        request.interfaceId = self.interfaceId
        request.command = command
        request.device = device
        request.axis = axis
        request.checkErrors = checkErrors
        request.timeout = timeout

        let response = try await Gateway.callAsync("interface/generic_command_multi_response", request, DtoRequests.GenericCommandResponseCollection.fromByteArray)
        return response.responses
    }

    /**
     Module: ZaberMotionAscii

     Enables alerts for all devices on the connection.
     This will change the "comm.alert" setting to 1 on all supported devices.
     */
    public func enableAlerts() async throws  {
        var request = DtoRequests.GenericCommandRequest()
        request.interfaceId = self.interfaceId
        request.command = "set comm.alert 1"

        try await Gateway.callAsync("interface/generic_command_no_response", request)
    }

    /**
     Module: ZaberMotionAscii

     Disables alerts for all devices on the connection.
     This will change the "comm.alert" setting to 0 on all supported devices.
     */
    public func disableAlerts() async throws  {
        var request = DtoRequests.GenericCommandRequest()
        request.interfaceId = self.interfaceId
        request.command = "set comm.alert 0"

        try await Gateway.callAsync("interface/generic_command_no_response", request)
    }

    /**
     Module: ZaberMotionAscii

     Resets ASCII protocol message IDs. Only for testing purposes.
     */
    public func resetIds() throws  {
        var request = DtoRequests.InterfaceEmptyRequest()
        request.interfaceId = self.interfaceId

        try Gateway.callSync("interface/reset_ids", request)
    }

    /**
     Module: ZaberMotionAscii

     Close the connection.
     */
    public func close() async throws  {
        var request = DtoRequests.InterfaceEmptyRequest()
        request.interfaceId = self.interfaceId

        try await Gateway.callAsync("interface/close", request)
    }

    /**
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

     Renumbers devices present on this connection. After renumbering, devices need to be identified again.

     - Parameters:
        - firstAddress: This is the address that the device closest to the computer is given.
          Remaining devices are numbered consecutively.

     - Returns: Total number of devices that responded to the renumber.
     */
    public func renumberDevices(firstAddress: Int = 1) async throws -> Int {
        guard firstAddress > 0 else {
            throw ZaberMotionExceptions.InvalidArgumentException(message: "Invalid value; device addresses are numbered from 1.")
        }

        var request = DtoRequests.RenumberRequest()
        request.interfaceId = self.interfaceId
        request.address = firstAddress

        let response = try await Gateway.callAsync("device/renumber_all", request, DtoRequests.IntResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Attempts to detect any devices present on this connection.

     - Parameters:
        - identifyDevices: Determines whether device identification should be performed as well.

     - Returns: Array of detected devices.
     */
    public func detectDevices(identifyDevices: Bool = true) async throws -> [Device] {
        _assertSendable(Device.self)

        var request = DtoRequests.DeviceDetectRequest()
        request.interfaceId = self.interfaceId
        request.identifyDevices = identifyDevices

        let response = try await Gateway.callAsync("device/detect", request, DtoRequests.DeviceDetectResponse.fromByteArray)
        return try response.devices.map { try getDevice(deviceAddress: $0) }
    }

    /**
     Module: ZaberMotionAscii

     Forgets all the information associated with devices on the connection.
     Useful when devices are removed from the chain indefinitely.

     - Parameters:
        - exceptDevices: Addresses of devices that should not be forgotten.
     */
    public func forgetDevices(exceptDevices: [Int] = []) throws  {
        var request = DtoRequests.ForgetDevicesRequest()
        request.interfaceId = self.interfaceId
        request.exceptDevices = exceptDevices

        try Gateway.callSync("device/forget", request)
    }

    /**
     Module: ZaberMotionAscii

     Stops all of the devices on this connection.

     - Parameters:
        - waitUntilIdle: Determines whether the function should return immediately
          or wait until the devices are stopped.

     - Returns: The addresses of the devices that were stopped by this command.
     */
    public func stopAll(waitUntilIdle: Bool = true) async throws -> [Int] {
        var request = DtoRequests.DeviceOnAllRequest()
        request.interfaceId = self.interfaceId
        request.waitUntilIdle = waitUntilIdle

        let response = try await Gateway.callAsync("device/stop_all", request, DtoRequests.DeviceOnAllResponse.fromByteArray)
        return response.deviceAddresses
    }

    /**
     Module: ZaberMotionAscii

     Homes all of the devices on this connection.

     - Parameters:
        - waitUntilIdle: Determines whether the function should return immediately
          or wait until the devices are homed.

     - Returns: The addresses of the devices that were homed by this command.
     */
    public func homeAll(waitUntilIdle: Bool = true) async throws -> [Int] {
        var request = DtoRequests.DeviceOnAllRequest()
        request.interfaceId = self.interfaceId
        request.waitUntilIdle = waitUntilIdle

        let response = try await Gateway.callAsync("device/home_all", request, DtoRequests.DeviceOnAllResponse.fromByteArray)
        return response.deviceAddresses
    }

    /**
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

     Returns default request timeout.

     - Returns: Default request timeout.
     */
    func retrieveTimeout() throws -> Int {
        var request = DtoRequests.InterfaceEmptyRequest()
        request.interfaceId = self.interfaceId

        let response = try Gateway.callSync("interface/get_timeout", request, DtoRequests.IntResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Sets default request timeout.

     - Parameters:
        - timeout: Default request timeout.
     */
    func changeTimeout(timeout: Int) throws  {
        var request = DtoRequests.SetInterfaceTimeoutRequest()
        request.interfaceId = self.interfaceId
        request.timeout = timeout

        try Gateway.callSync("interface/set_timeout", request)
    }

    /**
     Module: ZaberMotionAscii

     Returns checksum enabled.

     - Returns: Checksum enabled.
     */
    func retrieveChecksumEnabled() throws -> Bool {
        var request = DtoRequests.InterfaceEmptyRequest()
        request.interfaceId = self.interfaceId

        let response = try Gateway.callSync("interface/get_checksum_enabled", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Sets checksum enabled.

     - Parameters:
        - isEnabled: Checksum enabled.
     */
    func changeChecksumEnabled(isEnabled: Bool) throws  {
        var request = DtoRequests.SetInterfaceChecksumEnabledRequest()
        request.interfaceId = self.interfaceId
        request.isEnabled = isEnabled

        try Gateway.callSync("interface/set_checksum_enabled", request)
    }


    /**
    Module: ZaberMotionAscii
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
     Force initialization of lazy event publishers to avoid race conditions.
    */
    private func ensureSubscribed() {
        _ = self.disconnected
        _ = self.alert
        _ = self.unknownResponse
    }

    /**
     Module: ZaberMotionAscii

     Event invoked when connection is interrupted or closed.
     */
    public lazy var disconnected = {
        return Events.shared.disconnected.filter {
            disconnectedEvent in
            return disconnectedEvent.interfaceId == self.interfaceId
        }.first()
        .eraseToAnyPublisher()
        .share()
    }()

    /**
     Module: ZaberMotionAscii

     Event invoked when an alert is received from a device.
     */
    public lazy var alert = {
        return Events.shared.alert.prefix(
            untilOutputFrom: disconnected
        ).filter {
            alertEventWrapper in
            return alertEventWrapper.interfaceId == self.interfaceId
        }.map {
            alertEventWrapper in
            return alertEventWrapper.alert
        }.eraseToAnyPublisher()
        .share()
    }()

    /**
     Module: ZaberMotionAscii

     Event invoked when a response from a device cannot be matched to any known request.
     */
    public lazy var unknownResponse = {
        return Events.shared.unknownResponse.prefix(
            untilOutputFrom: disconnected
        ).filter {
            unknownResponseEventWrapper in
            return unknownResponseEventWrapper.interfaceId == self.interfaceId
        }.map {
            unknownResponseEventWrapper in
            return unknownResponseEventWrapper.unknownResponse
        }.eraseToAnyPublisher()
        .share()
    }()
}
