// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import UnitsInternal
import Dto
import DtoRequests
import DtoBinary
import Gateway
import ZaberMotionExceptions
import Utils

/**
 Module: ZaberMotionBinary

 Represents a device using the binary protocol.
 */
public final class Device: @unchecked Sendable {

    package init(connection: Connection, deviceAddress: Int) {
        self.connection = connection
        self.deviceAddress = deviceAddress

        // force initialization of lazy properties to avoid race conditions
        _ = self.settings
    }

    /**
     Module: ZaberMotionBinary

     Default timeout for move commands in seconds.
     */
    public static let defaultMovementTimeout: Double = 60;

    /**
     Module: ZaberMotionBinary

     Connection of this device.
     */
    public let connection: Connection

    /**
     Module: ZaberMotionBinary

     Settings and properties of this axis.
     */
    public private(set) lazy var settings: DeviceSettings = DeviceSettings(device: self)

    /**
     Module: ZaberMotionBinary

     The device address uniquely identifies the device on the connection.
     It can be configured or automatically assigned by the renumber command.
     */
    public let deviceAddress: Int

    /**
     Module: ZaberMotionBinary

     Identity of the device.
     */
    public var identity: DeviceIdentity {
        get throws { return try retrieveIdentity() }
    }

    /**
     Module: ZaberMotionBinary

     Indicates whether or not the device has been identified.
     */
    public var isIdentified: Bool {
        get throws { return try retrieveIsIdentified() }
    }

    /**
     Module: ZaberMotionBinary

     Unique ID of the device hardware.
     */
    public var deviceId: Int {
        get throws { return try identity.deviceId }
    }

    /**
     Module: ZaberMotionBinary

     Serial number of the device.
     Requires at least Firmware 6.15 for devices or 6.24 for peripherals.
     */
    public var serialNumber: UInt {
        get throws { return try identity.serialNumber }
    }

    /**
     Module: ZaberMotionBinary

     Name of the product.
     */
    public var name: String {
        get throws { return try identity.name }
    }

    /**
     Module: ZaberMotionBinary

     Version of the firmware.
     */
    public var firmwareVersion: Dto.FirmwareVersion {
        get throws { return try identity.firmwareVersion }
    }

    /**
     Module: ZaberMotionBinary

     Indicates whether the device is a peripheral or part of an integrated device.
     */
    public var isPeripheral: Bool {
        get throws { return try identity.isPeripheral }
    }

    /**
     Module: ZaberMotionBinary

     Unique ID of the peripheral hardware.
     */
    public var peripheralId: Int {
        get throws { return try identity.peripheralId }
    }

    /**
     Module: ZaberMotionBinary

     Name of the peripheral hardware.
     */
    public var peripheralName: String {
        get throws { return try identity.peripheralName }
    }

    /**
     Module: ZaberMotionBinary

     Determines the type of an device and units it accepts.
     */
    public var deviceType: DtoBinary.DeviceType {
        get throws { return try identity.deviceType }
    }

    /**
     Module: ZaberMotionBinary

     Sends a generic Binary command to this device.
     For more information please refer to the
     [Binary Protocol Manual](https://www.zaber.com/protocol-manual?protocol=Binary#topic_quick_command_reference).

     - Parameters:
        - command: Command to send.
        - data: Optional data argument to the command. Defaults to zero.
        - timeout: Number of seconds to wait for a response from the device. 0 or negative defaults to 0.5s.
        - checkErrors: Controls whether to throw an exception when the device rejects the command.

     - Returns: A response to the command.
     */
    public func genericCommand(command: CommandCode, data: Int = 0, timeout: Double = 0.0, checkErrors: Bool = true) async throws -> Message {
        _assertSendable(Message.self)

        var request = DtoRequests.GenericBinaryRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress
        request.command = command
        request.data = data
        request.timeout = timeout
        request.checkErrors = checkErrors

        return try await Gateway.callAsync("binary/interface/generic_command", request, Message.fromByteArray)
    }

    /**
     Module: ZaberMotionBinary

     Sends a generic Binary command to this device without expecting a response.
     For more information please refer to the
     [Binary Protocol Manual](https://www.zaber.com/protocol-manual?protocol=Binary#topic_quick_command_reference).

     - Parameters:
        - command: Command to send.
        - data: Optional data argument to the command. Defaults to zero.
     */
    public func genericCommandNoResponse(command: CommandCode, data: Int = 0) async throws  {
        var request = DtoRequests.GenericBinaryRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress
        request.command = command
        request.data = data

        try await Gateway.callAsync("binary/interface/generic_command_no_response", request)
    }

    /**
     Module: ZaberMotionBinary

     Sends a generic Binary command to this device with unit conversions for both sent data and retrieved data.

     - Parameters:
        - command: Command to send.
        - data: Data argument to the command. Defaults to zero.
        - fromUnit: Unit to convert sent data from.
        - toUnit: Unit to convert retrieved data to.
        - timeout: Number of seconds to wait for a response from the device. 0 or negative defaults to 0.5s.

     - Returns: Data that has been converted to the provided unit.
     */
    public func genericCommandWithUnits(command: CommandCode, data: Double = 0, fromUnit: Units = Units.native, toUnit: Units = Units.native, timeout: Double = 0.0) async throws -> Double {
        var request = DtoRequests.BinaryGenericWithUnitsRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress
        request.command = command
        request.data = data
        request.fromUnit = fromUnit
        request.toUnit = toUnit
        request.timeout = timeout

        let response = try await Gateway.callAsync("binary/device/generic_command_with_units", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionBinary

     Homes device. Device returns to its homing position.

     - Parameters:
        - unit: Unit to convert returned position to.
        - timeout: Number of seconds to wait for response from the device chain (defaults to 60s).

     - Returns: Current position that has been converted to the provided unit.
     */
    public func home(unit: Units = Units.native, timeout: Double = Device.defaultMovementTimeout) async throws -> Double {
        var request = DtoRequests.BinaryDeviceHomeRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress
        request.unit = unit
        request.timeout = timeout

        let response = try await Gateway.callAsync("binary/device/home", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionBinary

     Stops ongoing device movement. Decelerates until zero speed.

     - Parameters:
        - unit: Unit to convert returned position to.
        - timeout: Number of seconds to wait for response from the device chain (defaults to 60s).

     - Returns: Current position that has been converted to the provided unit.
     */
    public func stop(unit: Units = Units.native, timeout: Double = Device.defaultMovementTimeout) async throws -> Double {
        var request = DtoRequests.BinaryDeviceStopRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress
        request.unit = unit
        request.timeout = timeout

        let response = try await Gateway.callAsync("binary/device/stop", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionBinary

     Move device to absolute position.

     - Parameters:
        - position: Absolute position.
        - unit: Unit for the provided position as well as position returned by the device.
        - timeout: Number of seconds to wait for response from the device chain (defaults to 60s).

     - Returns: Current position that has been converted to the provided unit.
     */
    public func moveAbsolute(position: Double, unit: Units = Units.native, timeout: Double = Device.defaultMovementTimeout) async throws -> Double {
        var request = DtoRequests.BinaryDeviceMoveRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress
        request.type = DtoRequests.AxisMoveType.abs
        request.arg = position
        request.unit = unit
        request.timeout = timeout

        let response = try await Gateway.callAsync("binary/device/move", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionBinary

     Move device to position relative to current position.

     - Parameters:
        - position: Relative position.
        - unit: Unit for the provided position as well as position returned by the device.
        - timeout: Number of seconds to wait for response from the device chain (defaults to 60s).

     - Returns: Current position that has been converted to the provided unit.
     */
    public func moveRelative(position: Double, unit: Units = Units.native, timeout: Double = Device.defaultMovementTimeout) async throws -> Double {
        var request = DtoRequests.BinaryDeviceMoveRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress
        request.type = DtoRequests.AxisMoveType.rel
        request.arg = position
        request.unit = unit
        request.timeout = timeout

        let response = try await Gateway.callAsync("binary/device/move", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionBinary

     Begins to move device at specified speed.

     - Parameters:
        - velocity: Movement velocity.
        - unit: Unit to convert returned velocity to.

     - Returns: Device velocity that has been converted to the provided unit.
     */
    public func moveVelocity(velocity: Double, unit: Units = Units.native) async throws -> Double {
        var request = DtoRequests.BinaryDeviceMoveRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress
        request.type = DtoRequests.AxisMoveType.vel
        request.arg = velocity
        request.unit = unit

        let response = try await Gateway.callAsync("binary/device/move", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionBinary

     Waits until device stops moving.
     */
    public func waitUntilIdle() async throws  {
        var request = DtoRequests.DeviceEmptyRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress

        try await Gateway.callAsync("binary/device/wait_until_idle", request)
    }

    /**
     Module: ZaberMotionBinary

     Check whether the device is moving.

     - Returns: True if the device is currently executing a motion command.
     */
    public func isBusy() async throws -> Bool {
        var request = DtoRequests.DeviceEmptyRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress

        let response = try await Gateway.callAsync("binary/device/is_busy", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionBinary

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

        return try await Gateway.callAsync("binary/device/identify", request, DeviceIdentity.fromByteArray)
    }

    /**
     Module: ZaberMotionBinary

     Parks the axis.
     Motor drivers remain enabled and hold current continues to be applied until the device is powered off.
     It can later be unparked and moved without first having to home it.
     Requires at least Firmware 6.06.
     */
    public func park() async throws  {
        var request = DtoRequests.DeviceEmptyRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress

        try await Gateway.callAsync("binary/device/park", request)
    }

    /**
     Module: ZaberMotionBinary

     Unparks axis. Axis will now be able to move.
     Requires at least Firmware 6.06.
     */
    public func unpark() async throws  {
        var request = DtoRequests.DeviceEmptyRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress

        try await Gateway.callAsync("binary/device/unpark", request)
    }

    /**
     Module: ZaberMotionBinary

     Returns bool indicating whether the axis is parked or not.
     Requires at least Firmware 6.06.

     - Returns: True if the axis is currently parked. False otherwise.
     */
    public func isParked() async throws -> Bool {
        var request = DtoRequests.DeviceEmptyRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress

        let response = try await Gateway.callAsync("binary/device/is_parked", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionBinary

     Returns current device position.

     - Parameters:
        - unit: Units of position.

     - Returns: Axis position.
     */
    public func getPosition(unit: Units = Units.native) async throws -> Double {
        var request = DtoRequests.BinaryDeviceGetSettingRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress
        request.setting = BinarySettings.currentPosition
        request.unit = unit

        let response = try await Gateway.callAsync("binary/device/get_setting", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionBinary

     Returns a string that represents the device.

     - Returns: A string that represents the device.
     */
    public func toString() throws -> String {
        var request = DtoRequests.DeviceEmptyRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress

        let response = try Gateway.callSync("binary/device/device_to_string", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionBinary

     Returns identity.

     - Returns: Device identity.
     */
    func retrieveIdentity() throws -> DeviceIdentity {
        var request = DtoRequests.DeviceEmptyRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress

        return try Gateway.callSync("binary/device/get_identity", request, DeviceIdentity.fromByteArray)
    }

    /**
     Module: ZaberMotionBinary

     Returns whether or not the device have been identified.

     - Returns: True if the device has already been identified. False otherwise.
     */
    func retrieveIsIdentified() throws -> Bool {
        var request = DtoRequests.DeviceEmptyRequest()
        request.interfaceId = self.connection.interfaceId
        request.device = self.deviceAddress

        let response = try Gateway.callSync("binary/device/get_is_identified", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

}
