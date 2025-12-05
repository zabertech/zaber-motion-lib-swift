// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Dto
import DtoRequests
import Gateway
import ZaberMotionExceptions
import Utils

/**
 Module: ZaberMotionAscii

 Represents the controller part of one device - may be either a standalone controller or an integrated controller.
 */
public final class Device: @unchecked Sendable {

    package init(connection: Connection, deviceAddress: Int) {
        self.connection = connection
        self.deviceAddress = deviceAddress

        // force initialization of lazy properties to avoid race conditions
        _ = self.settings
        _ = self.storage
        _ = self.io
        _ = self.allAxes
        _ = self.warnings
        _ = self.oscilloscope
        _ = self.triggers
        _ = self.streams
        _ = self.pvt
    }

    /**
     Module: ZaberMotionAscii

     Connection of this device.
     */
    public let connection: Connection

    /**
     Module: ZaberMotionAscii

     The device address uniquely identifies the device on the connection.
     It can be configured or automatically assigned by the renumber command.
     */
    public let deviceAddress: Int

    /**
     Module: ZaberMotionAscii

     Settings and properties of this device.
     */
    public private(set) lazy var settings: DeviceSettings = DeviceSettings(device: self)

    /**
     Module: ZaberMotionAscii

     Key-value storage of this device.
     */
    public private(set) lazy var storage: DeviceStorage = DeviceStorage(device: self)

    /**
     Module: ZaberMotionAscii

     I/O channels of this device.
     */
    public private(set) lazy var io: DeviceIO = DeviceIO(device: self)

    /**
     Module: ZaberMotionAscii

     Virtual axis which allows you to target all axes of this device.
     */
    public private(set) lazy var allAxes: AllAxes = AllAxes(device: self)

    /**
     Module: ZaberMotionAscii

     Warnings and faults of this device and all its axes.
     */
    public private(set) lazy var warnings: Warnings = Warnings(device: self, axisNumber: 0)

    /**
     Module: ZaberMotionAscii

     Identity of the device.
     */
    public var identity: DeviceIdentity {
        get throws { return try retrieveIdentity() }
    }

    /**
     Module: ZaberMotionAscii

     Indicates whether or not the device has been identified.
     */
    public var isIdentified: Bool {
        get throws { return try retrieveIsIdentified() }
    }

    /**
     Module: ZaberMotionAscii

     Oscilloscope recording helper for this device.
     Requires at least Firmware 7.00.
     */
    public private(set) lazy var oscilloscope: Oscilloscope = Oscilloscope(device: self)

    /**
     Module: ZaberMotionAscii

     Unique ID of the device hardware.
     */
    public var deviceId: Int {
        get throws { return try identity.deviceId }
    }

    /**
     Module: ZaberMotionAscii

     Serial number of the device.
     */
    public var serialNumber: UInt {
        get throws { return try identity.serialNumber }
    }

    /**
     Module: ZaberMotionAscii

     Name of the product.
     */
    public var name: String {
        get throws { return try identity.name }
    }

    /**
     Module: ZaberMotionAscii

     Number of axes this device has.
     */
    public var axisCount: Int {
        get throws { return try identity.axisCount }
    }

    /**
     Module: ZaberMotionAscii

     Version of the firmware.
     */
    public var firmwareVersion: FirmwareVersion {
        get throws { return try identity.firmwareVersion }
    }

    /**
     Module: ZaberMotionAscii

     The device is an integrated product.
     */
    public var isIntegrated: Bool {
        get throws { return try identity.isIntegrated }
    }

    /**
     Module: ZaberMotionAscii

     User-assigned label of the device.
     */
    public var label: String {
        get throws { return try retrieveLabel() }
    }

    /**
     Module: ZaberMotionAscii

     Triggers for this device.
     Requires at least Firmware 7.06.
     */
    public private(set) lazy var triggers: Triggers = Triggers(device: self)

    /**
     Module: ZaberMotionAscii

     Gets an object that provides access to Streams on this device.
     Requires at least Firmware 7.05.
     */
    public private(set) lazy var streams: Streams = Streams(device: self)

    /**
     Module: ZaberMotionAscii

     Gets an object that provides access to PVT functions of this device.
     Note that as of ZML v5.0.0, this returns a Pvt object and NOT a PvtSequence object.
     The PvtSequence can now be obtained from the Pvt object.
     Requires at least Firmware 7.33.
     */
    public private(set) lazy var pvt: Pvt = Pvt(device: self)

    /**
     Module: ZaberMotionAscii

     Queries the device and the database, gathering information about the product.
     Without this information features such as unit conversions will not work.
     Usually, called automatically by detect devices method.

     - Parameters:
        - assumeVersion: The identification assumes the specified firmware version
          instead of the version queried from the device.
          Providing this argument can lead to unexpected compatibility issues.

     - Returns: Device identification data.
     */
    public func identify(assumeVersion: FirmwareVersion? = nil) async throws -> DeviceIdentity {
        _assertSendable(DeviceIdentity.self)

        var request = DtoRequests.DeviceIdentifyRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress
        request.assumeVersion = assumeVersion

        let response = try await Gateway.callAsync("device/identify", request, DeviceIdentity.fromByteArray)
        return response
    }

    /**
     Module: ZaberMotionAscii

     Sends a generic ASCII command to this device.
     For more information refer to: [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_commands).

     - Parameters:
        - command: Command and its parameters.
        - axis: Optional axis number to send the command to.
        - checkErrors: Controls whether to throw an exception when the device rejects the command.
        - timeout: The timeout, in milliseconds, for a device to respond to the command.
          Overrides the connection default request timeout.

     - Returns: A response to the command.
     */
    public func genericCommand(command: String, axis: Int = 0, checkErrors: Bool = true, timeout: Int = 0) async throws -> Response {
        _assertSendable(Response.self)

        var request = DtoRequests.GenericCommandRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress
        request.command = command
        request.axis = axis
        request.checkErrors = checkErrors
        request.timeout = timeout

        let response = try await Gateway.callAsync("interface/generic_command", request, Response.fromByteArray)
        return response
    }

    /**
     Module: ZaberMotionAscii

     Sends a generic ASCII command to this device and expect multiple responses.
     Responses are returned in order of arrival.
     For more information refer to: [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_commands).

     - Parameters:
        - command: Command and its parameters.
        - axis: Optional axis number to send the command to.
        - checkErrors: Controls whether to throw an exception when a device rejects the command.
        - timeout: The timeout, in milliseconds, for a device to respond to the command.
          Overrides the connection default request timeout.

     - Returns: All responses to the command.
     */
    public func genericCommandMultiResponse(command: String, axis: Int = 0, checkErrors: Bool = true, timeout: Int = 0) async throws -> [Response] {
        _assertSendable(Response.self)

        var request = DtoRequests.GenericCommandRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress
        request.command = command
        request.axis = axis
        request.checkErrors = checkErrors
        request.timeout = timeout

        let response = try await Gateway.callAsync("interface/generic_command_multi_response", request, DtoRequests.GenericCommandResponseCollection.fromByteArray)
        return response.responses
    }

    /**
     Module: ZaberMotionAscii

     Sends a generic ASCII command to this device without expecting a response and without adding a message ID
     For more information refer to: [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_commands).

     - Parameters:
        - command: Command and its parameters.
        - axis: Optional axis number to send the command to.
          Specifying -1 omits the number completely.
     */
    public func genericCommandNoResponse(command: String, axis: Int = 0) async throws  {
        var request = DtoRequests.GenericCommandRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress
        request.command = command
        request.axis = axis

        try await Gateway.callAsync("interface/generic_command_no_response", request)
    }

    /**
     Module: ZaberMotionAscii

     Gets an Axis class instance which allows you to control a particular axis on this device.
     Axes are numbered from 1.

     - Parameters:
        - axisNumber: Number of axis intended to control.

     - Returns: Axis instance.
     */
    public func getAxis(axisNumber: Int) throws -> Axis {
        guard axisNumber > 0 else {
            throw ZaberMotionExceptions.InvalidArgumentException(message: "Invalid value; physical axes are numbered from 1.")
        }

        return Axis(device: self, axisNumber: axisNumber)
    }

    /**
     Module: ZaberMotionAscii

     Gets a Lockstep class instance which allows you to control a particular lockstep group on the device.
     Requires at least Firmware 6.15 or 7.11.

     - Parameters:
        - lockstepGroupId: The ID of the lockstep group to control. Lockstep group IDs start at one.

     - Returns: Lockstep instance.
     */
    public func getLockstep(lockstepGroupId: Int) throws -> Lockstep {
        guard lockstepGroupId > 0 else {
            throw ZaberMotionExceptions.InvalidArgumentException(message: "Invalid value; lockstep groups are numbered from 1.")
        }

        return Lockstep(device: self, lockstepGroupId: lockstepGroupId)
    }

    /**
     Module: ZaberMotionAscii

     Formats parameters into a command and performs unit conversions.
     Parameters in the command template are denoted by a question mark.
     Command returned is only valid for this device.
     Unit conversion is not supported for commands where axes can be remapped, such as stream and PVT commands.
     For more information refer to: [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_commands).

     - Parameters:
        - commandTemplate: Template of a command to prepare. Parameters are denoted by question marks.
        - parameters: Variable number of command parameters.

     - Returns: Command with converted parameters.
     */
    public func prepareCommand(commandTemplate: String, _ parameters: Measurement...) throws -> String {
        var request = DtoRequests.PrepareCommandRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress
        request.commandTemplate = commandTemplate
        request.parameters = parameters

        let response = try Gateway.callSync("device/prepare_command", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Retrieves unit conversion descriptors for a command, allowing unit conversion without a device.
     The descriptors can be used with the ConvertTo/FromNativeUnits methods of the UnitTable class.
     Parameters in the command template are denoted by a question mark.
     For more information refer to: [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_commands).

     - Parameters:
        - commandTemplate: Template of the command. Parameters are denoted by question marks.

     - Returns: Unit conversion descriptor for each parameter in the command. Nil if a parameter does not have conversion.
     */
    public func getCommandUnitConversionDescriptors(commandTemplate: String) throws -> [UnitConversionDescriptor?] {
        var request = DtoRequests.PrepareCommandRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress
        request.commandTemplate = commandTemplate

        let response = try Gateway.callSync("device/get_command_unit_conversion", request, DtoRequests.GetCommandUnitConversionResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Sets the user-assigned device label.
     The label is stored on the controller and recognized by other software.

     - Parameters:
        - label: Label to set.
     */
    public func setLabel(label: String) async throws  {
        var request = DtoRequests.DeviceSetStorageRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress
        request.value = label

        try await Gateway.callAsync("device/set_label", request)
    }

    /**
     Module: ZaberMotionAscii

     Returns a string that represents the device.

     - Returns: A string that represents the device.
     */
    public func toString() throws -> String {
        var request = DtoRequests.AxisToStringRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress

        let response = try Gateway.callSync("device/device_to_string", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Returns a serialization of the current device state that can be saved and reapplied.

     - Returns: A serialization of the current state of the device.
     */
    public func getState() async throws -> String {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress

        let response = try await Gateway.callAsync("device/get_state", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Applies a saved state to this device.

     - Parameters:
        - state: The state object to apply to this device.
        - deviceOnly: If true, only device scope settings and features will be set.

     - Returns: Reports of any issues that were handled, but caused the state to not be exactly restored.
     */
    public func setState(state: String, deviceOnly: Bool = false) async throws -> SetStateDeviceResponse {
        _assertSendable(SetStateDeviceResponse.self)

        var request = DtoRequests.SetStateRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress
        request.state = state
        request.deviceOnly = deviceOnly

        let response = try await Gateway.callAsync("device/set_device_state", request, SetStateDeviceResponse.fromByteArray)
        return response
    }

    /**
     Module: ZaberMotionAscii

     Checks if a state can be applied to this device.
     This only covers exceptions that can be determined statically such as mismatches of ID or version,
     the process of applying the state can still fail when running.

     - Parameters:
        - state: The state object to check against.
        - firmwareVersion: The firmware version of the device to apply the state to.
          Use this to ensure the state will still be compatible after an update.

     - Returns: An object listing errors that come up when trying to set the state.
     */
    public func canSetState(state: String, firmwareVersion: FirmwareVersion? = nil) async throws -> CanSetStateDeviceResponse {
        _assertSendable(CanSetStateDeviceResponse.self)

        var request = DtoRequests.CanSetStateRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress
        request.state = state
        request.firmwareVersion = firmwareVersion

        let response = try await Gateway.callAsync("device/can_set_state", request, CanSetStateDeviceResponse.fromByteArray)
        return response
    }

    /**
     Module: ZaberMotionAscii

     Waits for the device to start responding to messages.
     Useful to call after resetting the device.
     Throws RequestTimeoutException upon timeout.

     - Parameters:
        - timeout: For how long to wait in milliseconds for the device to start responding.
     */
    public func waitToRespond(timeout: Double) async throws  {
        var request = DtoRequests.WaitToRespondRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress
        request.timeout = timeout

        try await Gateway.callAsync("device/wait_to_respond", request)
    }

    /**
     Module: ZaberMotionAscii

     Changes the address of this device.
     After the address is successfully changed, the existing device class instance no longer represents the device.
     Instead, use the new device instance returned by this method.

     - Parameters:
        - address: The new address to assign to the device.

     - Returns: New device instance with the new address.
     */
    public func renumber(address: Int) async throws -> Device {
        _assertSendable(Device.self)

        guard address >= 1 && address <= 99 else {
            throw ZaberMotionExceptions.InvalidArgumentException(message: "Invalid value; device addresses are numbered from 1 to 99.")
        }

        var request = DtoRequests.RenumberRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress
        request.address = address

        let response = try await Gateway.callAsync("device/renumber", request, DtoRequests.IntResponse.fromByteArray)
        return Device(connection: self.connection, deviceAddress: response.value)
    }

    /**
     Module: ZaberMotionAscii

     Restores most of the settings to their default values.
     Deletes all triggers, stream and PVT buffers, servo tunings.
     Deletes all zaber storage keys.
     Disables locksteps, unparks axes.
     Preserves storage, communication settings, peripherals (unless hard is specified).
     The device needs to be identified again after the restore.

     - Parameters:
        - hard: If true, completely erases device's memory. The device also resets.
     */
    public func restore(hard: Bool = false) async throws  {
        var request = DtoRequests.DeviceRestoreRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress
        request.hard = hard

        try await Gateway.callAsync("device/restore", request)
    }

    /**
     Module: ZaberMotionAscii

     Gets the device name.

     - Returns: The label.
     */
    func retrieveLabel() throws -> String {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress

        let response = try Gateway.callSync("device/get_label", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Returns identity.

     - Returns: Device identity.
     */
    func retrieveIdentity() throws -> DeviceIdentity {
        var request = DtoRequests.DeviceEmptyRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress

        let response = try Gateway.callSync("device/get_identity", request, DeviceIdentity.fromByteArray)
        return response
    }

    /**
     Module: ZaberMotionAscii

     Returns whether or not the device have been identified.

     - Returns: True if the device has already been identified. False otherwise.
     */
    func retrieveIsIdentified() throws -> Bool {
        var request = DtoRequests.DeviceEmptyRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress

        let response = try Gateway.callSync("device/get_is_identified", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

}
