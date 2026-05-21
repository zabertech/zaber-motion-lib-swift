// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import DtoRequests
import ZaberMotionAscii
import ZaberMotionExceptions
import Gateway
import UnitsInternal
import Dto
import DtoMovement
import Utils

/**
 Module: ZaberMotionMovement

 Represents something that moves: either an axis of a device, or a lockstep group.
 */
public final class Moveable: @unchecked Sendable {

    package init(moveableId: Int, device: Device) {
        self.moveableId = moveableId
        self.device = device
    }

    /**
     Module: ZaberMotionMovement

     The identifier for the moveable instance.
     */
    public let moveableId: Int

    /**
     Module: ZaberMotionMovement

     The device this moveable is on.
     */
    public let device: Device

    /**
     Module: ZaberMotionMovement

     Creates a Moveable instance for a given axis.

     - Parameters:
        - axis: Axis to create a Moveable for.
        - units: Default units of measurement used for movement operations.

     - Returns: A Moveable instance for the specified axis.
     */
    public static func fromAxis(axis: Axis, units: DefaultMotionUnits? = nil) async throws -> Moveable {
        _assertSendable(Moveable.self)

        var request = DtoRequests.MoveableSetupRequest()
        request.interfaceId = axis.device.connection.interfaceId
        request.moveableNumber = axis.axisNumber
        request.moveableType = MoveableType.axis
        request.device = axis.device.deviceAddress
        request.defaultUnits = units

        let response = try await Gateway.callAsync("moveable/setup", request, DtoRequests.IntResponse.fromByteArray)
        return Moveable(moveableId: response.value, device: axis.device)
    }

    /**
     Module: ZaberMotionMovement

     Creates a Moveable instance for a given lockstep group.

     - Parameters:
        - lockstep: Lockstep group to create a Moveable for.
        - units: Default units of measurement used for movement operations.

     - Returns: A Moveable instance for the specified lockstep group.
     */
    public static func fromLockstep(lockstep: Lockstep, units: DefaultMotionUnits? = nil) async throws -> Moveable {
        _assertSendable(Moveable.self)

        var request = DtoRequests.MoveableSetupRequest()
        request.interfaceId = lockstep.device.connection.interfaceId
        request.moveableNumber = lockstep.lockstepGroupId
        request.moveableType = MoveableType.lockstep
        request.device = lockstep.device.deviceAddress
        request.defaultUnits = units

        let response = try await Gateway.callAsync("moveable/setup", request, DtoRequests.IntResponse.fromByteArray)
        return Moveable(moveableId: response.value, device: lockstep.device)
    }

    /**
     Module: ZaberMotionMovement

     Creates a Moveable instance for a single-axis device.

     - Parameters:
        - device: Device to create a Moveable for.
        - units: Default units of measurement used for movement operations.

     - Returns: A Moveable instance for the specified device.
     */
    public static func fromDevice(device: Device, units: DefaultMotionUnits? = nil) async throws -> Moveable {
        _assertSendable(Moveable.self)

        var request = DtoRequests.MoveableSetupRequest()
        request.interfaceId = device.connection.interfaceId
        request.moveableNumber = 1
        request.moveableType = MoveableType.device
        request.device = device.deviceAddress
        request.defaultUnits = units

        let response = try await Gateway.callAsync("moveable/setup", request, DtoRequests.IntResponse.fromByteArray)
        return Moveable(moveableId: response.value, device: device)
    }

    /**
     Module: ZaberMotionMovement

     Moves to an absolute position.

     - Parameters:
        - position: Absolute position to move to.
        - velocity: Movement velocity. If not specified, the maximum velocity setting is used.
        - acceleration: Movement acceleration. If not specified, the default acceleration setting is used.
        - waitUntilIdle: Determines whether function should return after the movement is finished or just started.
        - cyclicDirection: Which direction a cyclic device should take to get to the target position.
        - extraCycles: Number of extra cycles to complete before stopping at the target.
     */
    public func moveAbsolute(position: MeasurementOrValue, velocity: MeasurementOrValue? = nil, acceleration: MeasurementOrValue? = nil, waitUntilIdle: Bool = true, cyclicDirection: CyclicDirection? = nil, extraCycles: Int? = nil) async throws  {
        var request = DtoRequests.MoveableMoveRequest()
        request.moveableId = self.moveableId
        request.position = position
        request.velocity = velocity
        request.acceleration = acceleration
        request.waitUntilIdle = waitUntilIdle
        request.cyclicDirection = cyclicDirection
        request.extraCycles = extraCycles

        try await Gateway.callAsync("moveable/move_abs", request)
    }

    /**
     Module: ZaberMotionMovement

     Moves by a relative amount from the current position.

     - Parameters:
        - position: Relative displacement to move by.
        - velocity: Movement velocity. If not specified, the maximum velocity setting is used.
        - acceleration: Movement acceleration. If not specified, the default acceleration setting is used.
        - waitUntilIdle: Determines whether function should return after the movement is finished or just started.
     */
    public func moveRelative(position: MeasurementOrValue, velocity: MeasurementOrValue? = nil, acceleration: MeasurementOrValue? = nil, waitUntilIdle: Bool = true) async throws  {
        var request = DtoRequests.MoveableMoveRequest()
        request.moveableId = self.moveableId
        request.position = position
        request.velocity = velocity
        request.acceleration = acceleration
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("moveable/move_rel", request)
    }

    /**
     Module: ZaberMotionMovement

     Begins moving at a specified velocity.

     - Parameters:
        - velocity: Velocity to move at.
        - acceleration: Movement acceleration. If not specified, the default acceleration setting is used.
        - waitUntilIdle: Determines whether function should return after the movement is finished or just started.
     */
    public func moveVelocity(velocity: MeasurementOrValue, acceleration: MeasurementOrValue? = nil, waitUntilIdle: Bool = true) async throws  {
        var request = DtoRequests.MoveableMoveRequest()
        request.moveableId = self.moveableId
        request.velocity = velocity
        request.acceleration = acceleration
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("moveable/move_vel", request)
    }

    /**
     Module: ZaberMotionMovement

     Moves to the end of travel.

     - Parameters:
        - velocity: Movement velocity. If not specified, the maximum velocity setting is used.
        - acceleration: Movement acceleration. If not specified, the default acceleration setting is used.
        - waitUntilIdle: Determines whether function should return after the movement is finished or just started.
     */
    public func moveMax(velocity: MeasurementOrValue? = nil, acceleration: MeasurementOrValue? = nil, waitUntilIdle: Bool = true) async throws  {
        var request = DtoRequests.MoveableMoveRequest()
        request.moveableId = self.moveableId
        request.velocity = velocity
        request.acceleration = acceleration
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("moveable/move_max", request)
    }

    /**
     Module: ZaberMotionMovement

     Moves to the beginning of travel.

     - Parameters:
        - velocity: Movement velocity. If not specified, the maximum velocity setting is used.
        - acceleration: Movement acceleration. If not specified, the default acceleration setting is used.
        - waitUntilIdle: Determines whether function should return after the movement is finished or just started.
     */
    public func moveMin(velocity: MeasurementOrValue? = nil, acceleration: MeasurementOrValue? = nil, waitUntilIdle: Bool = true) async throws  {
        var request = DtoRequests.MoveableMoveRequest()
        request.moveableId = self.moveableId
        request.velocity = velocity
        request.acceleration = acceleration
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("moveable/move_min", request)
    }

    /**
     Module: ZaberMotionMovement

     Returns the current position of the moveable.

     - Parameters:
        - unit: Units of position. If not specified, the default position unit is used.

     - Returns: Current position.
     */
    public func getPosition(unit: Units? = nil) async throws -> Double {
        var request = DtoRequests.MoveableGetSettingRequest()
        request.moveableId = self.moveableId
        request.unit = unit

        let response = try await Gateway.callAsync("moveable/get_position", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionMovement

     Returns the current encoder position of the moveable.

     - Parameters:
        - unit: Units of position. If not specified, the default position unit is used.

     - Returns: Current encoder position.
     */
    public func getEncoderPosition(unit: Units? = nil) async throws -> Double {
        var request = DtoRequests.MoveableGetSettingRequest()
        request.moveableId = self.moveableId
        request.unit = unit

        let response = try await Gateway.callAsync("moveable/get_encoder_position", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionMovement

     Moves the moveable to the home position.

     - Parameters:
        - waitUntilIdle: Determines whether function should return after the movement is finished or just started.
     */
    public func home(waitUntilIdle: Bool = true) async throws  {
        var request = DtoRequests.MoveableMoveRequest()
        request.moveableId = self.moveableId
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("moveable/home", request)
    }

    /**
     Module: ZaberMotionMovement

     Returns bool indicating whether the moveable has position reference and was homed.

     - Returns: True if the moveable has position reference and was homed.
     */
    public func isHomed() async throws -> Bool {
        var request = DtoRequests.MoveableIdRequest()
        request.moveableId = self.moveableId

        let response = try await Gateway.callAsync("moveable/is_homed", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionMovement

     Returns bool indicating whether the moveable is executing a motion command.

     - Returns: True if the moveable is currently executing a motion command.
     */
    public func isBusy() async throws -> Bool {
        var request = DtoRequests.MoveableIdRequest()
        request.moveableId = self.moveableId

        let response = try await Gateway.callAsync("moveable/is_busy", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionMovement

     Returns bool indicating whether the moveable is parked.

     - Returns: True if the moveable is parked.
     */
    public func isParked() async throws -> Bool {
        var request = DtoRequests.MoveableIdRequest()
        request.moveableId = self.moveableId

        let response = try await Gateway.callAsync("moveable/is_parked", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionMovement

     Stops ongoing movement of the moveable.

     - Parameters:
        - waitUntilIdle: Determines whether function should return after the movement is finished or just started.
     */
    public func stop(waitUntilIdle: Bool = true) async throws  {
        var request = DtoRequests.MoveableMoveRequest()
        request.moveableId = self.moveableId
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("moveable/stop", request)
    }

    /**
     Module: ZaberMotionMovement

     Moves the moveable in a sinusoidal trajectory.

     - Parameters:
        - amplitude: Amplitude of the sinusoidal motion (half of the motion's peak-to-peak range).
        - period: Period of the sinusoidal motion.
        - count: Number of sinusoidal cycles to complete.
          Must be a multiple of 0.5.
          If count is not specified or set to 0, the moveable will move indefinitely.
        - waitUntilIdle: Determines whether function should return after the movement is finished or just started.
     */
    public func moveSin(amplitude: MeasurementOrValue, period: MeasurementOrValue, count: Double = 0, waitUntilIdle: Bool = true) async throws  {
        var request = DtoRequests.MoveableMoveSinRequest()
        request.moveableId = self.moveableId
        request.amplitude = amplitude
        request.period = period
        request.count = count
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("moveable/move_sin", request)
    }

    /**
     Module: ZaberMotionMovement

     Stops the moveable at the end of the sinusoidal trajectory.
     If the sinusoidal motion was started with an integer-plus-half cycle count,
     the motion ends at the half-way point of the sinusoidal trajectory.

     - Parameters:
        - waitUntilIdle: Determines whether function should return after the movement is finished.
     */
    public func moveSinStop(waitUntilIdle: Bool = true) async throws  {
        var request = DtoRequests.MoveableMoveRequest()
        request.moveableId = self.moveableId
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("moveable/move_sin_stop", request)
    }

    /**
     Module: ZaberMotionMovement

     Parks the moveable.
     */
    public func park() async throws  {
        var request = DtoRequests.MoveableIdRequest()
        request.moveableId = self.moveableId

        try await Gateway.callAsync("moveable/park", request)
    }

    /**
     Module: ZaberMotionMovement

     Unparks the moveable.
     */
    public func unpark() async throws  {
        var request = DtoRequests.MoveableIdRequest()
        request.moveableId = self.moveableId

        try await Gateway.callAsync("moveable/unpark", request)
    }

    /**
     Module: ZaberMotionMovement

     Returns the current velocity of the moveable.

     - Parameters:
        - unit: Units of velocity. If not specified, the default velocity unit is used.

     - Returns: Current velocity.
     */
    public func getVelocity(unit: Units? = nil) async throws -> Double {
        var request = DtoRequests.MoveableGetSettingRequest()
        request.moveableId = self.moveableId
        request.unit = unit

        let response = try await Gateway.callAsync("moveable/get_velocity", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionMovement

     Returns the maximum speed that this moveable will execute moves at by default.
     If a different velocity is specified on a move command, that will override
     this value for that command only.

     - Parameters:
        - unit: Units of velocity. If not specified, the default velocity unit is used.

     - Returns: Maximum speed.
     */
    public func getMaxSpeed(unit: Units? = nil) async throws -> Double {
        var request = DtoRequests.MoveableGetSettingRequest()
        request.moveableId = self.moveableId
        request.unit = unit

        let response = try await Gateway.callAsync("moveable/get_max_speed", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionMovement

     Sets the maximum speed of the moveable. For a lockstep group, sets the value on all axes.

     - Parameters:
        - speed: Maximum speed to set.
     */
    public func setMaxSpeed(speed: MeasurementOrValue) async throws  {
        var request = DtoRequests.MoveableSetSettingRequest()
        request.moveableId = self.moveableId
        request.value = speed

        try await Gateway.callAsync("moveable/set_max_speed", request)
    }

    /**
     Module: ZaberMotionMovement

     Returns the maximum acceleration of the moveable. For a lockstep group, returns the lowest value across all axes.

     - Parameters:
        - accelType: Which acceleration ramp to return. Defaults to AccelDecel.
        - unit: Units of acceleration. If not specified, the default acceleration unit is used.

     - Returns: Maximum acceleration.
     */
    public func getMaxAcceleration(accelType: AccelType? = nil, unit: Units? = nil) async throws -> Double {
        var request = DtoRequests.MoveableGetAccelerationRequest()
        request.moveableId = self.moveableId
        request.accelType = accelType
        request.unit = unit

        let response = try await Gateway.callAsync("moveable/get_max_acceleration", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionMovement

     Sets the maximum acceleration of the moveable. For a lockstep group, sets the value on all axes.

     - Parameters:
        - accel: Maximum acceleration to set.
        - accelType: Which acceleration ramp to set. Defaults to AccelDecel.
     */
    public func setMaxAcceleration(accel: MeasurementOrValue, accelType: AccelType? = nil) async throws  {
        var request = DtoRequests.MoveableSetAccelerationRequest()
        request.moveableId = self.moveableId
        request.accel = accel
        request.accelType = accelType

        try await Gateway.callAsync("moveable/set_max_acceleration", request)
    }

    /**
     Module: ZaberMotionMovement

     Returns the minimum limit of the moveable.

     - Parameters:
        - unit: Units of position. If not specified, the default position unit is used.

     - Returns: Minimum limit.
     */
    public func getLimitMin(unit: Units? = nil) async throws -> Double {
        var request = DtoRequests.MoveableGetSettingRequest()
        request.moveableId = self.moveableId
        request.unit = unit

        let response = try await Gateway.callAsync("moveable/get_limit_min", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionMovement

     Returns the maximum limit of the moveable.

     - Parameters:
        - unit: Units of position. If not specified, the default position unit is used.

     - Returns: Maximum limit.
     */
    public func getLimitMax(unit: Units? = nil) async throws -> Double {
        var request = DtoRequests.MoveableGetSettingRequest()
        request.moveableId = self.moveableId
        request.unit = unit

        let response = try await Gateway.callAsync("moveable/get_limit_max", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionMovement

     Returns the lockstep group this moveable represents, or null if it is not a lockstep moveable.

     - Returns: Lockstep instance, or null if this is not a lockstep moveable.
     */
    public func getLockstep() async throws -> Lockstep? {
        _assertSendable(Lockstep.self)

        var request = DtoRequests.MoveableIdRequest()
        request.moveableId = self.moveableId

        let response = try await Gateway.callAsync("moveable/get_lockstep", request, DtoRequests.IntResponse.fromByteArray)
        return response.value != 0 ? Lockstep(device: device, lockstepGroupId: response.value) : nil
    }

    /**
     Module: ZaberMotionMovement

     Returns the axis this moveable represents.
     For a lockstep moveable, returns the primary axis of the lockstep group.

     - Returns: Axis this moveable is based on.
     */
    public func getAxis() async throws -> Axis {
        _assertSendable(Axis.self)

        var request = DtoRequests.MoveableIdRequest()
        request.moveableId = self.moveableId

        let response = try await Gateway.callAsync("moveable/get_axis", request, DtoRequests.IntResponse.fromByteArray)
        return Axis(device: device, axisNumber: response.value)
    }

    /**
     Module: ZaberMotionMovement

     Disables the driver, which prevents current from being sent to the motor or load.
     If the driver is already disabled, the driver remains disabled.
     */
    public func driverDisable() async throws  {
        var request = DtoRequests.MoveableIdRequest()
        request.moveableId = self.moveableId

        try await Gateway.callAsync("moveable/driver_disable", request)
    }

    /**
     Module: ZaberMotionMovement

     Attempts to enable the driver repeatedly for the specified timeout.
     If the driver is already enabled, the driver remains enabled.

     - Parameters:
        - timeout: Timeout in seconds. Specify 0 to attempt to enable the driver once.
     */
    public func driverEnable(timeout: Double = 10) async throws  {
        var request = DtoRequests.MoveableDriverEnableRequest()
        request.moveableId = self.moveableId
        request.timeout = timeout

        try await Gateway.callAsync("moveable/driver_enable", request)
    }

    /**
     Module: ZaberMotionMovement

     Waits until the moveable stops moving.

     - Parameters:
        - throwErrorOnFault: Determines whether to throw error when fault is observed.
     */
    public func waitUntilIdle(throwErrorOnFault: Bool = true) async throws  {
        var request = DtoRequests.MoveableWaitUntilIdleRequest()
        request.moveableId = self.moveableId
        request.throwErrorOnFault = throwErrorOnFault

        try await Gateway.callAsync("moveable/wait_until_idle", request)
    }

    /**
     Module: ZaberMotionMovement

     Frees the moveable instance.

     - Parameters:
        - moveableId: The ID of the moveable to free.
     */
    static func free(moveableId: Int) throws  {
        var request = DtoRequests.MoveableIdRequest()
        request.moveableId = moveableId

        try Gateway.callSync("moveable/free", request)
    }

    deinit {
        guard moveableId >= 0 else { return }

        do {
            try Moveable.free(moveableId: self.moveableId)
        } catch {
            fatalError("Failed to free Moveable resource: \(error)")
        }
    }
}
