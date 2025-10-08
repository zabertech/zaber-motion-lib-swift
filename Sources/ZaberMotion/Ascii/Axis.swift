// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import UnitsInternal
import Dto
import DtoRequests
import Gateway
import ZaberMotionExceptions
import Utils

/**
 Module: ZaberMotionAscii

 Represents an axis of motion associated with a device.
 */
public final class Axis: @unchecked Sendable {

    package init(device: Device, axisNumber: Int) {
        self.device = device
        self.axisNumber = axisNumber
        self.warnings = Warnings(device: device, axisNumber: axisNumber)

        // force initialization of lazy properties to avoid race conditions
        _ = self.settings
        _ = self.storage
    }

    /**
     Module: ZaberMotionAscii

     Device that controls this axis.
     */
    public let device: Device

    /**
     Module: ZaberMotionAscii

     The axis number identifies the axis on the device.
     The first axis has the number one.
     */
    public let axisNumber: Int

    /**
     Module: ZaberMotionAscii

     Settings and properties of this axis.
     */
    public private(set) lazy var settings: AxisSettings = AxisSettings(axis: self)

    /**
     Module: ZaberMotionAscii

     Key-value storage of this axis.
     Requires at least Firmware 7.30.
     */
    public private(set) lazy var storage: AxisStorage = AxisStorage(axis: self)

    /**
     Module: ZaberMotionAscii

     Warnings and faults of this axis.
     */
    public let warnings: Warnings

    /**
     Module: ZaberMotionAscii

     Identity of the axis.
     */
    public var identity: AxisIdentity {
        get throws { return try retrieveIdentity() }
    }

    /**
     Module: ZaberMotionAscii

     Unique ID of the peripheral hardware.
     */
    public var peripheralId: Int {
        get throws { return try identity.peripheralId }
    }

    /**
     Module: ZaberMotionAscii

     Name of the peripheral.
     */
    public var peripheralName: String {
        get throws { return try identity.peripheralName }
    }

    /**
     Module: ZaberMotionAscii

     Serial number of the peripheral, or 0 when not applicable.
     */
    public var peripheralSerialNumber: UInt {
        get throws { return try identity.peripheralSerialNumber }
    }

    /**
     Module: ZaberMotionAscii

     Indicates whether the axis is a peripheral or part of an integrated device.
     */
    public var isPeripheral: Bool {
        get throws { return try identity.isPeripheral }
    }

    /**
     Module: ZaberMotionAscii

     Determines the type of an axis and units it accepts.
     */
    public var axisType: AxisType {
        get throws { return try identity.axisType }
    }

    /**
     Module: ZaberMotionAscii

     The number of microsteps per full step for motion axes. Always equal to 0 for non-motion axes.
     */
    public var resolution: UInt {
        get throws { return try identity.resolution }
    }

    /**
     Module: ZaberMotionAscii

     User-assigned label of the peripheral.
     */
    public var label: String {
        get throws { return try retrieveLabel() }
    }

    /**
     Module: ZaberMotionAscii

     Homes axis. Axis returns to its homing position.

     - Parameters:
        - waitUntilIdle: Determines whether function should return after the movement is finished or just started.
     */
    public func home(waitUntilIdle: Bool = true) async throws  {
        var request = DtoRequests.DeviceHomeRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("device/home", request)
    }

    /**
     Module: ZaberMotionAscii

     Stops ongoing axis movement. Decelerates until zero speed.

     - Parameters:
        - waitUntilIdle: Determines whether function should return after the movement is finished or just started.
     */
    public func stop(waitUntilIdle: Bool = true) async throws  {
        var request = DtoRequests.DeviceStopRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("device/stop", request)
    }

    /**
     Module: ZaberMotionAscii

     Parks the axis in anticipation of turning the power off.
     It can later be powered on, unparked, and moved without first having to home it.
     */
    public func park() async throws  {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber

        try await Gateway.callAsync("device/park", request)
    }

    /**
     Module: ZaberMotionAscii

     Unparks axis. Axis will now be able to move.
     */
    public func unpark() async throws  {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber

        try await Gateway.callAsync("device/unpark", request)
    }

    /**
     Module: ZaberMotionAscii

     Returns bool indicating whether the axis is parked or not.

     - Returns: True if the axis is currently parked. False otherwise.
     */
    public func isParked() async throws -> Bool {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber

        let response = try await Gateway.callAsync("device/is_parked", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Waits until axis stops moving.

     - Parameters:
        - throwErrorOnFault: Determines whether to throw error when fault is observed.
     */
    public func waitUntilIdle(throwErrorOnFault: Bool = true) async throws  {
        var request = DtoRequests.DeviceWaitUntilIdleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber
        request.throwErrorOnFault = throwErrorOnFault

        try await Gateway.callAsync("device/wait_until_idle", request)
    }

    /**
     Module: ZaberMotionAscii

     Returns bool indicating whether the axis is executing a motion command.

     - Returns: True if the axis is currently executing a motion command.
     */
    public func isBusy() async throws -> Bool {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber

        let response = try await Gateway.callAsync("device/is_busy", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Returns bool indicating whether the axis has position reference and was homed.

     - Returns: True if the axis has position reference and was homed.
     */
    public func isHomed() async throws -> Bool {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber

        let response = try await Gateway.callAsync("device/is_homed", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Move axis to absolute position.

     - Parameters:
        - position: Absolute position.
        - unit: Units of position.
        - waitUntilIdle: Determines whether function should return after the movement is finished or just started.
        - velocity: Movement velocity.
          Default value of 0 indicates that the maxspeed setting is used instead.
          Requires at least Firmware 7.25.
        - velocityUnit: Units of velocity.
        - acceleration: Movement acceleration.
          Default value of 0 indicates that the accel setting is used instead.
          Requires at least Firmware 7.25.
        - accelerationUnit: Units of acceleration.
     */
    public func moveAbsolute(position: Double, unit: Units = Units.native, waitUntilIdle: Bool = true, velocity: Double = 0, velocityUnit: Units = Units.native, acceleration: Double = 0, accelerationUnit: Units = Units.native) async throws  {
        var request = DtoRequests.DeviceMoveRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber
        request.type = DtoRequests.AxisMoveType.abs
        request.arg = position
        request.unit = unit
        request.waitUntilIdle = waitUntilIdle
        request.velocity = velocity
        request.velocityUnit = velocityUnit
        request.acceleration = acceleration
        request.accelerationUnit = accelerationUnit

        try await Gateway.callAsync("device/move", request)
    }

    /**
     Module: ZaberMotionAscii

     Moves the axis to the maximum position as specified by limit.max.

     - Parameters:
        - waitUntilIdle: Determines whether function should return after the movement is finished or just started.
        - velocity: Movement velocity.
          Default value of 0 indicates that the maxspeed setting is used instead.
          Requires at least Firmware 7.25.
        - velocityUnit: Units of velocity.
        - acceleration: Movement acceleration.
          Default value of 0 indicates that the accel setting is used instead.
          Requires at least Firmware 7.25.
        - accelerationUnit: Units of acceleration.
     */
    public func moveMax(waitUntilIdle: Bool = true, velocity: Double = 0, velocityUnit: Units = Units.native, acceleration: Double = 0, accelerationUnit: Units = Units.native) async throws  {
        var request = DtoRequests.DeviceMoveRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber
        request.type = DtoRequests.AxisMoveType.max
        request.waitUntilIdle = waitUntilIdle
        request.velocity = velocity
        request.velocityUnit = velocityUnit
        request.acceleration = acceleration
        request.accelerationUnit = accelerationUnit

        try await Gateway.callAsync("device/move", request)
    }

    /**
     Module: ZaberMotionAscii

     Moves the axis to the minimum position as specified by limit.min.

     - Parameters:
        - waitUntilIdle: Determines whether function should return after the movement is finished or just started.
        - velocity: Movement velocity.
          Default value of 0 indicates that the maxspeed setting is used instead.
          Requires at least Firmware 7.25.
        - velocityUnit: Units of velocity.
        - acceleration: Movement acceleration.
          Default value of 0 indicates that the accel setting is used instead.
          Requires at least Firmware 7.25.
        - accelerationUnit: Units of acceleration.
     */
    public func moveMin(waitUntilIdle: Bool = true, velocity: Double = 0, velocityUnit: Units = Units.native, acceleration: Double = 0, accelerationUnit: Units = Units.native) async throws  {
        var request = DtoRequests.DeviceMoveRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber
        request.type = DtoRequests.AxisMoveType.min
        request.waitUntilIdle = waitUntilIdle
        request.velocity = velocity
        request.velocityUnit = velocityUnit
        request.acceleration = acceleration
        request.accelerationUnit = accelerationUnit

        try await Gateway.callAsync("device/move", request)
    }

    /**
     Module: ZaberMotionAscii

     Move axis to position relative to current position.

     - Parameters:
        - position: Relative position.
        - unit: Units of position.
        - waitUntilIdle: Determines whether function should return after the movement is finished or just started.
        - velocity: Movement velocity.
          Default value of 0 indicates that the maxspeed setting is used instead.
          Requires at least Firmware 7.25.
        - velocityUnit: Units of velocity.
        - acceleration: Movement acceleration.
          Default value of 0 indicates that the accel setting is used instead.
          Requires at least Firmware 7.25.
        - accelerationUnit: Units of acceleration.
     */
    public func moveRelative(position: Double, unit: Units = Units.native, waitUntilIdle: Bool = true, velocity: Double = 0, velocityUnit: Units = Units.native, acceleration: Double = 0, accelerationUnit: Units = Units.native) async throws  {
        var request = DtoRequests.DeviceMoveRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber
        request.type = DtoRequests.AxisMoveType.rel
        request.arg = position
        request.unit = unit
        request.waitUntilIdle = waitUntilIdle
        request.velocity = velocity
        request.velocityUnit = velocityUnit
        request.acceleration = acceleration
        request.accelerationUnit = accelerationUnit

        try await Gateway.callAsync("device/move", request)
    }

    /**
     Module: ZaberMotionAscii

     Begins to move axis at specified speed.

     - Parameters:
        - velocity: Movement velocity.
        - unit: Units of velocity.
        - acceleration: Movement acceleration.
          Default value of 0 indicates that the accel setting is used instead.
          Requires at least Firmware 7.25.
        - accelerationUnit: Units of acceleration.
     */
    public func moveVelocity(velocity: Double, unit: Units = Units.native, acceleration: Double = 0, accelerationUnit: Units = Units.native) async throws  {
        var request = DtoRequests.DeviceMoveRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber
        request.type = DtoRequests.AxisMoveType.vel
        request.arg = velocity
        request.unit = unit
        request.acceleration = acceleration
        request.accelerationUnit = accelerationUnit

        try await Gateway.callAsync("device/move", request)
    }

    /**
     Module: ZaberMotionAscii

     Returns current axis position.

     - Parameters:
        - unit: Units of position.

     - Returns: Axis position.
     */
    public func getPosition(unit: Units = Units.native) async throws -> Double {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber
        request.setting = "pos"
        request.unit = unit

        let response = try await Gateway.callAsync("device/get_setting", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Gets number of index positions of the axis.

     - Returns: Number of index positions.
     */
    public func getNumberOfIndexPositions() async throws -> Int {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber

        let response = try await Gateway.callAsync("device/get_index_count", request, DtoRequests.IntResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Returns current axis index position.

     - Returns: Index position starting from 1 or 0 if the position is not an index position.
     */
    public func getIndexPosition() async throws -> Int {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber

        let response = try await Gateway.callAsync("device/get_index_position", request, DtoRequests.IntResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Moves the axis to index position.

     - Parameters:
        - index: Index position. Index positions are numbered from 1.
        - waitUntilIdle: Determines whether function should return after the movement is finished or just started.
        - velocity: Movement velocity.
          Default value of 0 indicates that the maxspeed setting is used instead.
          Requires at least Firmware 7.25.
        - velocityUnit: Units of velocity.
        - acceleration: Movement acceleration.
          Default value of 0 indicates that the accel setting is used instead.
          Requires at least Firmware 7.25.
        - accelerationUnit: Units of acceleration.
     */
    public func moveIndex(index: Int, waitUntilIdle: Bool = true, velocity: Double = 0, velocityUnit: Units = Units.native, acceleration: Double = 0, accelerationUnit: Units = Units.native) async throws  {
        var request = DtoRequests.DeviceMoveRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber
        request.type = DtoRequests.AxisMoveType.index
        request.argInt = index
        request.waitUntilIdle = waitUntilIdle
        request.velocity = velocity
        request.velocityUnit = velocityUnit
        request.acceleration = acceleration
        request.accelerationUnit = accelerationUnit

        try await Gateway.callAsync("device/move", request)
    }

    /**
     Module: ZaberMotionAscii

     Sends a generic ASCII command to this axis.
     For more information refer to: [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_commands).

     - Parameters:
        - command: Command and its parameters.
        - checkErrors: Controls whether to throw an exception when the device rejects the command.
        - timeout: The timeout, in milliseconds, for a device to respond to the command.
          Overrides the connection default request timeout.

     - Returns: A response to the command.
     */
    public func genericCommand(command: String, checkErrors: Bool = true, timeout: Int = 0) async throws -> Response {
        _assertSendable(Response.self)

        var request = DtoRequests.GenericCommandRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber
        request.command = command
        request.checkErrors = checkErrors
        request.timeout = timeout

        let response = try await Gateway.callAsync("interface/generic_command", request, Response.fromByteArray)
        return response
    }

    /**
     Module: ZaberMotionAscii

     Sends a generic ASCII command to this axis and expect multiple responses.
     Responses are returned in order of arrival.
     For more information refer to: [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_commands).

     - Parameters:
        - command: Command and its parameters.
        - checkErrors: Controls whether to throw an exception when a device rejects the command.
        - timeout: The timeout, in milliseconds, for a device to respond to the command.
          Overrides the connection default request timeout.

     - Returns: All responses to the command.
     */
    public func genericCommandMultiResponse(command: String, checkErrors: Bool = true, timeout: Int = 0) async throws -> [Response] {
        _assertSendable(Response.self)

        var request = DtoRequests.GenericCommandRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber
        request.command = command
        request.checkErrors = checkErrors
        request.timeout = timeout

        let response = try await Gateway.callAsync("interface/generic_command_multi_response", request, DtoRequests.GenericCommandResponseCollection.fromByteArray)
        return response.responses
    }

    /**
     Module: ZaberMotionAscii

     Sends a generic ASCII command to this axis without expecting a response and without adding a message ID
     For more information refer to: [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_commands).

     - Parameters:
        - command: Command and its parameters.
     */
    public func genericCommandNoResponse(command: String) async throws  {
        var request = DtoRequests.GenericCommandRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber
        request.command = command

        try await Gateway.callAsync("interface/generic_command_no_response", request)
    }

    /**
     Module: ZaberMotionAscii

     Formats parameters into a command and performs unit conversions.
     Parameters in the command template are denoted by a question mark.
     Command returned is only valid for this axis and this device.
     For more information refer to: [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_commands).

     - Parameters:
        - commandTemplate: Template of a command to prepare. Parameters are denoted by question marks.
        - parameters: Variable number of command parameters.

     - Returns: Command with converted parameters.
     */
    public func prepareCommand(commandTemplate: String, _ parameters: Measurement...) throws -> String {
        var request = DtoRequests.PrepareCommandRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber
        request.commandTemplate = commandTemplate
        request.parameters = parameters

        let response = try Gateway.callSync("device/prepare_command", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Sets the user-assigned peripheral label.
     The label is stored on the controller and recognized by other software.

     - Parameters:
        - label: Label to set.
     */
    public func setLabel(label: String) async throws  {
        var request = DtoRequests.DeviceSetStorageRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber
        request.value = label

        try await Gateway.callAsync("device/set_label", request)
    }

    /**
     Module: ZaberMotionAscii

     Returns a string that represents the axis.

     - Returns: A string that represents the axis.
     */
    public func toString() throws -> String {
        var request = DtoRequests.AxisToStringRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber

        let response = try Gateway.callSync("device/axis_to_string", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Returns a serialization of the current axis state that can be saved and reapplied.

     - Returns: A serialization of the current state of the axis.
     */
    public func getState() async throws -> String {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber

        let response = try await Gateway.callAsync("device/get_state", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Applies a saved state to this axis.

     - Parameters:
        - state: The state object to apply to this axis.

     - Returns: Reports of any issues that were handled, but caused the state to not be exactly restored.
     */
    public func setState(state: String) async throws -> SetStateAxisResponse {
        _assertSendable(SetStateAxisResponse.self)

        var request = DtoRequests.SetStateRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber
        request.state = state

        let response = try await Gateway.callAsync("device/set_axis_state", request, SetStateAxisResponse.fromByteArray)
        return response
    }

    /**
     Module: ZaberMotionAscii

     Checks if a state can be applied to this axis.
     This only covers exceptions that can be determined statically such as mismatches of ID or version,
     the process of applying the state can still fail when running.

     - Parameters:
        - state: The state object to check against.
        - firmwareVersion: The firmware version of the device to apply the state to.
          Use this to ensure the state will still be compatible after an update.

     - Returns: An explanation of why this state cannot be set to this axis.
     */
    public func canSetState(state: String, firmwareVersion: FirmwareVersion? = nil) async throws -> String? {
        var request = DtoRequests.CanSetStateRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber
        request.state = state
        request.firmwareVersion = firmwareVersion

        let response = try await Gateway.callAsync("device/can_set_axis_state", request, DtoRequests.CanSetStateAxisResponse.fromByteArray)
        return response.error
    }

    /**
     Module: ZaberMotionAscii

     Disables the driver, which prevents current from being sent to the motor or load.
     If the driver is already disabled, the driver remains disabled.
     */
    public func driverDisable() async throws  {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber

        try await Gateway.callAsync("device/driver_disable", request)
    }

    /**
     Module: ZaberMotionAscii

     Attempts to enable the driver repeatedly for the specified timeout.
     If the driver is already enabled, the driver remains enabled.

     - Parameters:
        - timeout: Timeout in seconds. Specify 0 to attempt to enable the driver once.
     */
    public func driverEnable(timeout: Double = 10) async throws  {
        var request = DtoRequests.DriverEnableRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber
        request.timeout = timeout

        try await Gateway.callAsync("device/driver_enable", request)
    }

    /**
     Module: ZaberMotionAscii

     Activates a peripheral on this axis.
     Removes all identity information for the device.
     Run the identify method on the device after activating to refresh the information.
     */
    public func activate() async throws  {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber

        try await Gateway.callAsync("device/activate", request)
    }

    /**
     Module: ZaberMotionAscii

     Restores all axis settings to their default values.
     Deletes all zaber axis storage keys.
     Disables lockstep if the axis is part of one. Unparks the axis.
     Preserves storage.
     The device needs to be identified again after the restore.
     */
    public func restore() async throws  {
        var request = DtoRequests.DeviceRestoreRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber

        try await Gateway.callAsync("device/restore", request)
    }

    /**
     Module: ZaberMotionAscii

     Moves the axis in a sinusoidal trajectory.

     - Parameters:
        - amplitude: Amplitude of the sinusoidal motion (half of the motion's peak-to-peak range).
        - amplitudeUnits: Units of position.
        - period: Period of the sinusoidal motion in milliseconds.
        - periodUnits: Units of time.
        - count: Number of sinusoidal cycles to complete.
          Must be a multiple of 0.5
          If count is not specified or set to 0, the axis will move indefinitely.
        - waitUntilIdle: Determines whether function should return after the movement is finished or just started.
     */
    public func moveSin(amplitude: Double, amplitudeUnits: Units, period: Double, periodUnits: Units, count: Double = 0, waitUntilIdle: Bool = true) async throws  {
        var request = DtoRequests.DeviceMoveSinRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber
        request.amplitude = amplitude
        request.amplitudeUnits = amplitudeUnits
        request.period = period
        request.periodUnits = periodUnits
        request.count = count
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("device/move_sin", request)
    }

    /**
     Module: ZaberMotionAscii

     Stops the axis at the end of the sinusoidal trajectory.
     If the sinusoidal motion was started with an integer-plus-half cycle count,
     the motion ends at the half-way point of the sinusoidal trajectory.

     - Parameters:
        - waitUntilIdle: Determines whether function should return after the movement is finished.
     */
    public func moveSinStop(waitUntilIdle: Bool = true) async throws  {
        var request = DtoRequests.DeviceStopRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("device/move_sin_stop", request)
    }

    /**
     Module: ZaberMotionAscii

     Gets the peripheral name.

     - Returns: The label.
     */
    func retrieveLabel() throws -> String {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber

        let response = try Gateway.callSync("device/get_label", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Returns identity.

     - Returns: Axis identity.
     */
    func retrieveIdentity() throws -> AxisIdentity {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = self.axisNumber

        let response = try Gateway.callSync("device/get_axis_identity", request, AxisIdentity.fromByteArray)
        return response
    }

}

