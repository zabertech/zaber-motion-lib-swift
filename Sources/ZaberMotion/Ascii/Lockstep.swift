﻿// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import UnitsInternal
import DtoRequests
import Gateway
import ZaberMotionExceptions
import Utils

/**
 Represents a lockstep group with this ID on a device.
 A lockstep group is a movement synchronized pair of axes on a device.
 Requires at least Firmware 6.15 or 7.11.
 */
public final class Lockstep {

    public init(device: Device, lockstepGroupId: Int) {
        self.device = device
        self.lockstepGroupId = lockstepGroupId
    }

    /**
     Device that controls this lockstep group.
     */
    public let device: Device

    /**
     The number that identifies the lockstep group on the device.
     */
    public let lockstepGroupId: Int

    /**
     Activate the lockstep group on the axes specified.

     - Parameters:
        - axes: The numbers of axes in the lockstep group.
     */
    public func enable(_ axes: Int...) async throws  {
        var request = DtoRequests.LockstepEnableRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.lockstepGroupId = self.lockstepGroupId
        request.axes = axes

        try await Gateway.callAsync("device/lockstep_enable", request)
    }

    /**
     Disable the lockstep group.
     */
    public func disable() async throws  {
        var request = DtoRequests.LockstepDisableRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.lockstepGroupId = self.lockstepGroupId

        try await Gateway.callAsync("device/lockstep_disable", request)
    }

    /**
     Stops ongoing lockstep group movement. Decelerates until zero speed.

     - Parameters:
        - waitUntilIdle: Determines whether function should return after the movement is finished or just started.
     */
    public func stop(waitUntilIdle: Bool = true) async throws  {
        var request = DtoRequests.LockstepStopRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.lockstepGroupId = self.lockstepGroupId
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("device/lockstep_stop", request)
    }

    /**
     Retracts the axes of the lockstep group until a home associated with an individual axis is detected.

     - Parameters:
        - waitUntilIdle: Determines whether function should return after the movement is finished or just started.
     */
    public func home(waitUntilIdle: Bool = true) async throws  {
        var request = DtoRequests.LockstepHomeRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.lockstepGroupId = self.lockstepGroupId
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("device/lockstep_home", request)
    }

    /**
     Move the first axis of the lockstep group to an absolute position.
     The other axes in the lockstep group maintain their offsets throughout movement.

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
        var request = DtoRequests.LockstepMoveRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.lockstepGroupId = self.lockstepGroupId
        request.type = DtoRequests.AxisMoveType.abs
        request.arg = position
        request.unit = unit
        request.waitUntilIdle = waitUntilIdle
        request.velocity = velocity
        request.velocityUnit = velocityUnit
        request.acceleration = acceleration
        request.accelerationUnit = accelerationUnit

        try await Gateway.callAsync("device/lockstep_move", request)
    }

    /**
     Move the first axis of the lockstep group to a position relative to its current position.
     The other axes in the lockstep group maintain their offsets throughout movement.

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
        var request = DtoRequests.LockstepMoveRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.lockstepGroupId = self.lockstepGroupId
        request.type = DtoRequests.AxisMoveType.rel
        request.arg = position
        request.unit = unit
        request.waitUntilIdle = waitUntilIdle
        request.velocity = velocity
        request.velocityUnit = velocityUnit
        request.acceleration = acceleration
        request.accelerationUnit = accelerationUnit

        try await Gateway.callAsync("device/lockstep_move", request)
    }

    /**
     Moves the first axis of the lockstep group at the specified speed.
     The other axes in the lockstep group maintain their offsets throughout movement.

     - Parameters:
        - velocity: Movement velocity.
        - unit: Units of velocity.
        - acceleration: Movement acceleration.
          Default value of 0 indicates that the accel setting is used instead.
          Requires at least Firmware 7.25.
        - accelerationUnit: Units of acceleration.
     */
    public func moveVelocity(velocity: Double, unit: Units = Units.native, acceleration: Double = 0, accelerationUnit: Units = Units.native) async throws  {
        var request = DtoRequests.LockstepMoveRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.lockstepGroupId = self.lockstepGroupId
        request.type = DtoRequests.AxisMoveType.vel
        request.arg = velocity
        request.unit = unit
        request.acceleration = acceleration
        request.accelerationUnit = accelerationUnit

        try await Gateway.callAsync("device/lockstep_move", request)
    }

    /**
     Moves the first axis of the lockstep group in a sinusoidal trajectory.
     The other axes in the lockstep group maintain their offsets throughout movement.

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
        var request = DtoRequests.LockstepMoveSinRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.lockstepGroupId = self.lockstepGroupId
        request.amplitude = amplitude
        request.amplitudeUnits = amplitudeUnits
        request.period = period
        request.periodUnits = periodUnits
        request.count = count
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("device/lockstep_move_sin", request)
    }

    /**
     Stops the lockstep group at the end of the sinusoidal trajectory for the first axis.
     If the sinusoidal motion was started with an integer-plus-half cycle count,
     the motion ends at the half-way point of the sinusoidal trajectory.

     - Parameters:
        - waitUntilIdle: Determines whether function should return after the movement is finished.
     */
    public func moveSinStop(waitUntilIdle: Bool = true) async throws  {
        var request = DtoRequests.LockstepStopRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.lockstepGroupId = self.lockstepGroupId
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("device/lockstep_move_sin_stop", request)
    }

    /**
     Moves the axes to the maximum valid position.
     The axes in the lockstep group maintain their offsets throughout movement.
     Respects lim.max for all axes in the group.

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
        var request = DtoRequests.LockstepMoveRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.lockstepGroupId = self.lockstepGroupId
        request.type = DtoRequests.AxisMoveType.max
        request.waitUntilIdle = waitUntilIdle
        request.velocity = velocity
        request.velocityUnit = velocityUnit
        request.acceleration = acceleration
        request.accelerationUnit = accelerationUnit

        try await Gateway.callAsync("device/lockstep_move", request)
    }

    /**
     Moves the axes to the minimum valid position.
     The axes in the lockstep group maintain their offsets throughout movement.
     Respects lim.min for all axes in the group.

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
        var request = DtoRequests.LockstepMoveRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.lockstepGroupId = self.lockstepGroupId
        request.type = DtoRequests.AxisMoveType.min
        request.waitUntilIdle = waitUntilIdle
        request.velocity = velocity
        request.velocityUnit = velocityUnit
        request.acceleration = acceleration
        request.accelerationUnit = accelerationUnit

        try await Gateway.callAsync("device/lockstep_move", request)
    }

    /**
     Waits until the lockstep group stops moving.

     - Parameters:
        - throwErrorOnFault: Determines whether to throw error when fault is observed.
     */
    public func waitUntilIdle(throwErrorOnFault: Bool = true) async throws  {
        var request = DtoRequests.LockstepWaitUntilIdleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.lockstepGroupId = self.lockstepGroupId
        request.throwErrorOnFault = throwErrorOnFault

        try await Gateway.callAsync("device/lockstep_wait_until_idle", request)
    }

    /**
     Returns bool indicating whether the lockstep group is executing a motion command.

     - Returns: True if the axes are currently executing a motion command.
     */
    public func isBusy() async throws -> Bool {
        var request = DtoRequests.LockstepEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.lockstepGroupId = self.lockstepGroupId

        let response = try await Gateway.callAsync("device/lockstep_is_busy", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Gets the axes of the lockstep group.

     - Returns: LockstepAxes instance which contains the axes numbers of the lockstep group.
     */
    @available(*, deprecated, message: "Use GetAxisNumbers instead.")
    public func getAxes() async throws -> LockstepAxes {
        _assertSendable(LockstepAxes.self)

        var request = DtoRequests.LockstepEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.lockstepGroupId = self.lockstepGroupId

        return try await Gateway.callAsync("device/lockstep_get_axes", request, LockstepAxes.fromByteArray)
    }

    /**
     Gets the axis numbers of the lockstep group.

     - Returns: Axis numbers in order specified when enabling lockstep.
     */
    public func getAxisNumbers() async throws -> [Int] {
        var request = DtoRequests.LockstepEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.lockstepGroupId = self.lockstepGroupId

        let response = try await Gateway.callAsync("device/lockstep_get_axis_numbers", request, DtoRequests.LockstepGetAxisNumbersResponse.fromByteArray)
        return response.axes
    }

    /**
     Gets the initial offsets of secondary axes of an enabled lockstep group.

     - Parameters:
        - unit: Units of position.
          Uses primary axis unit conversion.

     - Returns: Initial offset for each axis of the lockstep group.
     */
    public func getOffsets(unit: Units = Units.native) async throws -> [Double] {
        var request = DtoRequests.LockstepGetRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.lockstepGroupId = self.lockstepGroupId
        request.unit = unit

        let response = try await Gateway.callAsync("device/lockstep_get_offsets", request, DtoRequests.DoubleArrayResponse.fromByteArray)
        return response.values
    }

    /**
     Gets the twists of secondary axes of an enabled lockstep group.

     - Parameters:
        - unit: Units of position.
          Uses primary axis unit conversion.

     - Returns: Difference between the initial offset and the actual offset for each axis of the lockstep group.
     */
    public func getTwists(unit: Units = Units.native) async throws -> [Double] {
        var request = DtoRequests.LockstepGetRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.lockstepGroupId = self.lockstepGroupId
        request.unit = unit

        let response = try await Gateway.callAsync("device/lockstep_get_twists", request, DtoRequests.DoubleArrayResponse.fromByteArray)
        return response.values
    }

    /**
     Returns current position of the primary axis.

     - Parameters:
        - unit: Units of the position.

     - Returns: Primary axis position.
     */
    public func getPosition(unit: Units = Units.native) async throws -> Double {
        var request = DtoRequests.LockstepGetRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.lockstepGroupId = self.lockstepGroupId
        request.unit = unit

        let response = try await Gateway.callAsync("device/lockstep_get_pos", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Sets lockstep twist tolerance.
     Twist tolerances that do not match the system configuration can reduce performance or damage the system.

     - Parameters:
        - tolerance: Twist tolerance.
        - unit: Units of the tolerance.
          Uses primary axis unit conversion when setting to all axes,
          otherwise uses specified secondary axis unit conversion.
        - axisIndex: Optional index of a secondary axis to set the tolerance for.
          If left empty or set to 0, the tolerance is set to all the secondary axes.
     */
    public func setTolerance(tolerance: Double, unit: Units = Units.native, axisIndex: Int = 0) async throws  {
        var request = DtoRequests.LockstepSetRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.lockstepGroupId = self.lockstepGroupId
        request.value = tolerance
        request.unit = unit
        request.axisIndex = axisIndex

        try await Gateway.callAsync("device/lockstep_set_tolerance", request)
    }

    /**
     Checks if the lockstep group is currently enabled on the device.

     - Returns: True if a lockstep group with this ID is enabled on the device.
     */
    public func isEnabled() async throws -> Bool {
        var request = DtoRequests.LockstepEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.lockstepGroupId = self.lockstepGroupId

        let response = try await Gateway.callAsync("device/lockstep_is_enabled", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Returns a string which represents the enabled lockstep group.

     - Returns: String which represents the enabled lockstep group.
     */
    public func toString() throws -> String {
        var request = DtoRequests.LockstepEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.lockstepGroupId = self.lockstepGroupId

        let response = try Gateway.callSync("device/lockstep_to_string", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }


}

