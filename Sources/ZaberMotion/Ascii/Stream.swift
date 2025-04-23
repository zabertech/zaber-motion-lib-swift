// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import UnitsInternal
import Dto
import DtoRequests
import Gateway
import ZaberMotionExceptions

/**
 Module: ZaberMotionAscii

 A handle for a stream with this number on the device.
 Streams provide a way to execute or store a sequence of actions.
 Stream methods append actions to a queue which executes or stores actions in a first in, first out order.
 */
public final class Stream: @unchecked Sendable {

    package init(device: Device, streamId: Int) {
        self.device = device
        self.streamId = streamId
        self.io = StreamIo(device: device, streamId: streamId)
    }

    /**
     Module: ZaberMotionAscii

     Device that controls this stream.
     */
    public let device: Device

    /**
     Module: ZaberMotionAscii

     The number that identifies the stream on the device.
     */
    public let streamId: Int

    /**
     Module: ZaberMotionAscii

     Current mode of the stream.
     */
    public var mode: StreamMode {
        get throws { return try retrieveMode() }
    }

    /**
     Module: ZaberMotionAscii

     An array of axes definitions the stream is set up to control.
     */
    public var axes: [StreamAxisDefinition] {
        get throws { return try retrieveAxes() }
    }

    /**
     Module: ZaberMotionAscii

     Gets an object that provides access to I/O for this stream.
     */
    public let io: StreamIo

    /**
     Module: ZaberMotionAscii

     Setup the stream to control the specified axes and to queue actions on the device.
     Allows use of lockstep axes in a stream.

     - Parameters:
        - axes: Definition of the stream axes.
     */
    public func setupLiveComposite(_ axes: StreamAxisDefinition...) async throws  {
        var request = DtoRequests.StreamSetupLiveCompositeRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.axes = axes

        try await Gateway.callAsync("device/stream_setup_live_composite", request)
    }

    /**
     Module: ZaberMotionAscii

     Setup the stream to control the specified axes and to queue actions on the device.

     - Parameters:
        - axes: Numbers of physical axes to setup the stream on.
     */
    public func setupLive(_ axes: Int...) async throws  {
        var request = DtoRequests.StreamSetupLiveRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.axes = axes

        try await Gateway.callAsync("device/stream_setup_live", request)
    }

    /**
     Module: ZaberMotionAscii

     Setup the stream to control the specified axes and queue actions into a stream buffer.
     Allows use of lockstep axes in a stream.

     - Parameters:
        - streamBuffer: The stream buffer to queue actions in.
        - axes: Definition of the stream axes.
     */
    public func setupStoreComposite(streamBuffer: StreamBuffer, _ axes: StreamAxisDefinition...) async throws  {
        var request = DtoRequests.StreamSetupStoreCompositeRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.streamBuffer = streamBuffer.bufferId
        request.axes = axes

        try await Gateway.callAsync("device/stream_setup_store_composite", request)
    }

    /**
     Module: ZaberMotionAscii

     Setup the stream to control the specified axes and queue actions into a stream buffer.

     - Parameters:
        - streamBuffer: The stream buffer to queue actions in.
        - axes: Numbers of physical axes to setup the stream on.
     */
    public func setupStore(streamBuffer: StreamBuffer, _ axes: Int...) async throws  {
        var request = DtoRequests.StreamSetupStoreRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.streamBuffer = streamBuffer.bufferId
        request.axes = axes

        try await Gateway.callAsync("device/stream_setup_store", request)
    }

    /**
     Module: ZaberMotionAscii

     Setup the stream to use a specified number of axes, and to queue actions in a stream buffer.
     Afterwards, you may call the resulting stream buffer on arbitrary axes.
     This mode does not allow for unit conversions.

     - Parameters:
        - streamBuffer: The stream buffer to queue actions in.
        - axesCount: The number of axes in the stream.
     */
    public func setupStoreArbitraryAxes(streamBuffer: StreamBuffer, axesCount: Int) async throws  {
        var request = DtoRequests.StreamSetupStoreArbitraryAxesRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.streamBuffer = streamBuffer.bufferId
        request.axesCount = axesCount

        try await Gateway.callAsync("device/stream_setup_store_arbitrary_axes", request)
    }

    /**
     Module: ZaberMotionAscii

     Append the actions in a stream buffer to the queue.

     - Parameters:
        - streamBuffer: The stream buffer to call.
     */
    public func call(streamBuffer: StreamBuffer) async throws  {
        var request = DtoRequests.StreamCallRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.streamBuffer = streamBuffer.bufferId

        try await Gateway.callAsync("device/stream_call", request)
    }

    /**
     Module: ZaberMotionAscii

     Queue an absolute line movement in the stream.

     - Parameters:
        - endpoint: Positions for the axes to move to, relative to their home positions.
     */
    public func lineAbsolute(_ endpoint: Measurement...) async throws  {
        var request = DtoRequests.StreamLineRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.type = DtoRequests.StreamSegmentType.abs
        request.endpoint = endpoint

        try await Gateway.callAsync("device/stream_line", request)
    }

    /**
     Module: ZaberMotionAscii

     Queue a relative line movement in the stream.

     - Parameters:
        - endpoint: Positions for the axes to move to, relative to their positions before movement.
     */
    public func lineRelative(_ endpoint: Measurement...) async throws  {
        var request = DtoRequests.StreamLineRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.type = DtoRequests.StreamSegmentType.rel
        request.endpoint = endpoint

        try await Gateway.callAsync("device/stream_line", request)
    }

    /**
     Module: ZaberMotionAscii

     Queue an absolute line movement in the stream, targeting a subset of the stream axes.
     Requires at least Firmware 7.11.

     - Parameters:
        - targetAxesIndices: Indices of the axes in the stream the movement targets.
          Refers to the axes provided during the stream setup or further execution.
          Indices are zero-based.
        - endpoint: Positions for the axes to move to, relative to their home positions.
     */
    public func lineAbsoluteOn(targetAxesIndices: [Int], endpoint: [Measurement]) async throws  {
        var request = DtoRequests.StreamLineRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.type = DtoRequests.StreamSegmentType.abs
        request.targetAxesIndices = targetAxesIndices
        request.endpoint = endpoint

        try await Gateway.callAsync("device/stream_line", request)
    }

    /**
     Module: ZaberMotionAscii

     Queue a relative line movement in the stream, targeting a subset of the stream axes.
     Requires at least Firmware 7.11.

     - Parameters:
        - targetAxesIndices: Indices of the axes in the stream the movement targets.
          Refers to the axes provided during the stream setup or further execution.
          Indices are zero-based.
        - endpoint: Positions for the axes to move to, relative to their positions before movement.
     */
    public func lineRelativeOn(targetAxesIndices: [Int], endpoint: [Measurement]) async throws  {
        var request = DtoRequests.StreamLineRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.type = DtoRequests.StreamSegmentType.rel
        request.targetAxesIndices = targetAxesIndices
        request.endpoint = endpoint

        try await Gateway.callAsync("device/stream_line", request)
    }

    /**
     Module: ZaberMotionAscii

     Queue an absolute arc movement on the first two axes of the stream.
     Absolute meaning that the home positions of the axes is treated as the origin.

     - Parameters:
        - rotationDirection: The direction of the rotation.
        - centerX: The first dimension of the position of the center of the circle on which the arc exists.
        - centerY: The second dimension of the position of the center of the circle on which the arc exists.
        - endX: The first dimension of the end position of the arc.
        - endY: The second dimension of the end position of the arc.
     */
    public func arcAbsolute(rotationDirection: RotationDirection, centerX: Measurement, centerY: Measurement, endX: Measurement, endY: Measurement) async throws  {
        var request = DtoRequests.StreamArcRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.type = DtoRequests.StreamSegmentType.abs
        request.rotationDirection = rotationDirection
        request.centerX = centerX
        request.centerY = centerY
        request.endX = endX
        request.endY = endY

        try await Gateway.callAsync("device/stream_arc", request)
    }

    /**
     Module: ZaberMotionAscii

     Queue a relative arc movement on the first two axes of the stream.
     Relative meaning that the current position of the axes is treated as the origin.

     - Parameters:
        - rotationDirection: The direction of the rotation.
        - centerX: The first dimension of the position of the center of the circle on which the arc exists.
        - centerY: The second dimension of the position of the center of the circle on which the arc exists.
        - endX: The first dimension of the end position of the arc.
        - endY: The second dimension of the end position of the arc.
     */
    public func arcRelative(rotationDirection: RotationDirection, centerX: Measurement, centerY: Measurement, endX: Measurement, endY: Measurement) async throws  {
        var request = DtoRequests.StreamArcRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.type = DtoRequests.StreamSegmentType.rel
        request.rotationDirection = rotationDirection
        request.centerX = centerX
        request.centerY = centerY
        request.endX = endX
        request.endY = endY

        try await Gateway.callAsync("device/stream_arc", request)
    }

    /**
     Module: ZaberMotionAscii

     Queue an absolute arc movement in the stream.
     The movement will only target the specified subset of axes in the stream.
     Requires at least Firmware 7.11.

     - Parameters:
        - targetAxesIndices: Indices of the axes in the stream the movement targets.
          Refers to the axes provided during the stream setup or further execution.
          Indices are zero-based.
        - rotationDirection: The direction of the rotation.
        - centerX: The first dimension of the position of the center of the circle on which the arc exists.
        - centerY: The second dimension of the position of the center of the circle on which the arc exists.
        - endX: The first dimension of the end position of the arc.
        - endY: The second dimension of the end position of the arc.
     */
    public func arcAbsoluteOn(targetAxesIndices: [Int], rotationDirection: RotationDirection, centerX: Measurement, centerY: Measurement, endX: Measurement, endY: Measurement) async throws  {
        var request = DtoRequests.StreamArcRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.type = DtoRequests.StreamSegmentType.abs
        request.targetAxesIndices = targetAxesIndices
        request.rotationDirection = rotationDirection
        request.centerX = centerX
        request.centerY = centerY
        request.endX = endX
        request.endY = endY

        try await Gateway.callAsync("device/stream_arc", request)
    }

    /**
     Module: ZaberMotionAscii

     Queue a relative arc movement in the stream.
     The movement will only target the specified subset of axes in the stream.
     Requires at least Firmware 7.11.

     - Parameters:
        - targetAxesIndices: Indices of the axes in the stream the movement targets.
          Refers to the axes provided during the stream setup or further execution.
          Indices are zero-based.
        - rotationDirection: The direction of the rotation.
        - centerX: The first dimension of the position of the center of the circle on which the arc exists.
        - centerY: The second dimension of the position of the center of the circle on which the arc exists.
        - endX: The first dimension of the end position of the arc.
        - endY: The second dimension of the end position of the arc.
     */
    public func arcRelativeOn(targetAxesIndices: [Int], rotationDirection: RotationDirection, centerX: Measurement, centerY: Measurement, endX: Measurement, endY: Measurement) async throws  {
        var request = DtoRequests.StreamArcRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.type = DtoRequests.StreamSegmentType.rel
        request.targetAxesIndices = targetAxesIndices
        request.rotationDirection = rotationDirection
        request.centerX = centerX
        request.centerY = centerY
        request.endX = endX
        request.endY = endY

        try await Gateway.callAsync("device/stream_arc", request)
    }

    /**
     Module: ZaberMotionAscii

     Queue an absolute helix movement in the stream.
     Requires at least Firmware 7.28.

     - Parameters:
        - targetAxesIndices: Indices of the axes in the stream the movement targets.
          Refers to the axes provided during the stream setup or further execution.
          Indices are zero-based.
          The first two axes refer to the helix's arc component,
          while the rest refers to the helix's line component.
        - rotationDirection: The direction of the rotation.
        - centerX: The first dimension of the position of the center of the circle on which the helix projects.
        - centerY: The second dimension of the position of the center of the circle on which the helix projects.
        - endX: The first dimension of the end position of the helix's arc component.
        - endY: The second dimension of the end position of the helix's arc component.
        - endpoint: Positions for the helix's line component axes, relative to their home positions.
     */
    public func helixAbsoluteOn(targetAxesIndices: [Int], rotationDirection: RotationDirection, centerX: Measurement, centerY: Measurement, endX: Measurement, endY: Measurement, _ endpoint: Measurement...) async throws  {
        var request = DtoRequests.StreamArcRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.type = DtoRequests.StreamSegmentType.abs
        request.targetAxesIndices = targetAxesIndices
        request.rotationDirection = rotationDirection
        request.centerX = centerX
        request.centerY = centerY
        request.endX = endX
        request.endY = endY
        request.endpoint = endpoint

        try await Gateway.callAsync("device/stream_helix", request)
    }

    /**
     Module: ZaberMotionAscii

     Queue a relative helix movement in the stream.
     Requires at least Firmware 7.28.

     - Parameters:
        - targetAxesIndices: Indices of the axes in the stream the movement targets.
          Refers to the axes provided during the stream setup or further execution.
          Indices are zero-based.
          The first two axes refer to the helix's arc component,
          while the rest refers to the helix's line component.
        - rotationDirection: The direction of the rotation.
        - centerX: The first dimension of the position of the center of the circle on which the helix projects.
        - centerY: The second dimension of the position of the center of the circle on which the helix projects.
        - endX: The first dimension of the end position of the helix's arc component.
        - endY: The second dimension of the end position of the helix's arc component.
        - endpoint: Positions for the helix's line component axes, relative to their positions before movement.
     */
    public func helixRelativeOn(targetAxesIndices: [Int], rotationDirection: RotationDirection, centerX: Measurement, centerY: Measurement, endX: Measurement, endY: Measurement, _ endpoint: Measurement...) async throws  {
        var request = DtoRequests.StreamArcRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.type = DtoRequests.StreamSegmentType.rel
        request.targetAxesIndices = targetAxesIndices
        request.rotationDirection = rotationDirection
        request.centerX = centerX
        request.centerY = centerY
        request.endX = endX
        request.endY = endY
        request.endpoint = endpoint

        try await Gateway.callAsync("device/stream_helix", request)
    }

    /**
     Module: ZaberMotionAscii

     Queue an absolute circle movement on the first two axes of the stream.
     Absolute meaning that the home positions of the axes are treated as the origin.

     - Parameters:
        - rotationDirection: The direction of the rotation.
        - centerX: The first dimension of the position of the center of the circle.
        - centerY: The second dimension of the position of the center of the circle.
     */
    public func circleAbsolute(rotationDirection: RotationDirection, centerX: Measurement, centerY: Measurement) async throws  {
        var request = DtoRequests.StreamCircleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.type = DtoRequests.StreamSegmentType.abs
        request.rotationDirection = rotationDirection
        request.centerX = centerX
        request.centerY = centerY

        try await Gateway.callAsync("device/stream_circle", request)
    }

    /**
     Module: ZaberMotionAscii

     Queue a relative circle movement on the first two axes of the stream.
     Relative meaning that the current position of the axes is treated as the origin.

     - Parameters:
        - rotationDirection: The direction of the rotation.
        - centerX: The first dimension of the position of the center of the circle.
        - centerY: The second dimension of the position of the center of the circle.
     */
    public func circleRelative(rotationDirection: RotationDirection, centerX: Measurement, centerY: Measurement) async throws  {
        var request = DtoRequests.StreamCircleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.type = DtoRequests.StreamSegmentType.rel
        request.rotationDirection = rotationDirection
        request.centerX = centerX
        request.centerY = centerY

        try await Gateway.callAsync("device/stream_circle", request)
    }

    /**
     Module: ZaberMotionAscii

     Queue an absolute circle movement in the stream.
     The movement will only target the specified subset of axes in the stream.
     Requires at least Firmware 7.11.

     - Parameters:
        - targetAxesIndices: Indices of the axes in the stream the movement targets.
          Refers to the axes provided during the stream setup or further execution.
          Indices are zero-based.
        - rotationDirection: The direction of the rotation.
        - centerX: The first dimension of the position of the center of the circle.
        - centerY: The second dimension of the position of the center of the circle.
     */
    public func circleAbsoluteOn(targetAxesIndices: [Int], rotationDirection: RotationDirection, centerX: Measurement, centerY: Measurement) async throws  {
        var request = DtoRequests.StreamCircleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.type = DtoRequests.StreamSegmentType.abs
        request.targetAxesIndices = targetAxesIndices
        request.rotationDirection = rotationDirection
        request.centerX = centerX
        request.centerY = centerY

        try await Gateway.callAsync("device/stream_circle", request)
    }

    /**
     Module: ZaberMotionAscii

     Queue a relative circle movement in the stream.
     The movement will only target the specified subset of axes in the stream.
     Requires at least Firmware 7.11.

     - Parameters:
        - targetAxesIndices: Indices of the axes in the stream the movement targets.
          Refers to the axes provided during the stream setup or further execution.
          Indices are zero-based.
        - rotationDirection: The direction of the rotation.
        - centerX: The first dimension of the position of the center of the circle.
        - centerY: The second dimension of the position of the center of the circle.
     */
    public func circleRelativeOn(targetAxesIndices: [Int], rotationDirection: RotationDirection, centerX: Measurement, centerY: Measurement) async throws  {
        var request = DtoRequests.StreamCircleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.type = DtoRequests.StreamSegmentType.rel
        request.targetAxesIndices = targetAxesIndices
        request.rotationDirection = rotationDirection
        request.centerX = centerX
        request.centerY = centerY

        try await Gateway.callAsync("device/stream_circle", request)
    }

    /**
     Module: ZaberMotionAscii

     Wait a specified time.

     - Parameters:
        - time: Amount of time to wait.
        - unit: Units of time.
     */
    public func wait(time: Double, unit: Units = Units.native) async throws  {
        var request = DtoRequests.StreamWaitRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.time = time
        request.unit = unit

        try await Gateway.callAsync("device/stream_wait", request)
    }

    /**
     Module: ZaberMotionAscii

     Waits until the live stream executes all queued actions.

     - Parameters:
        - throwErrorOnFault: Determines whether to throw error when fault is observed.
     */
    public func waitUntilIdle(throwErrorOnFault: Bool = true) async throws  {
        var request = DtoRequests.StreamWaitUntilIdleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.throwErrorOnFault = throwErrorOnFault

        try await Gateway.callAsync("device/stream_wait_until_idle", request)
    }

    /**
     Module: ZaberMotionAscii

     Cork the front of the stream's action queue, blocking execution.
     Execution resumes upon uncorking the queue, or when the number of queued actions reaches its limit.
     Corking eliminates discontinuities in motion due to subsequent stream commands reaching the device late.
     You can only cork an idle live stream.
     */
    public func cork() async throws  {
        var request = DtoRequests.StreamEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId

        try await Gateway.callAsync("device/stream_cork", request)
    }

    /**
     Module: ZaberMotionAscii

     Uncork the front of the queue, unblocking command execution.
     You can only uncork an idle live stream that is corked.
     */
    public func uncork() async throws  {
        var request = DtoRequests.StreamEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId

        try await Gateway.callAsync("device/stream_uncork", request)
    }

    /**
     Module: ZaberMotionAscii

     Pauses or resumes execution of the stream in live mode.
     The hold only takes effect during execution of motion segments.

     - Parameters:
        - hold: True to pause execution, false to resume.
     */
    public func setHold(hold: Bool) async throws  {
        var request = DtoRequests.StreamSetHoldRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.hold = hold

        try await Gateway.callAsync("device/stream_set_hold", request)
    }

    /**
     Module: ZaberMotionAscii

     Returns a boolean value indicating whether the live stream is executing a queued action.

     - Returns: True if the stream is executing a queued action.
     */
    public func isBusy() async throws -> Bool {
        var request = DtoRequests.StreamEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId

        let response = try await Gateway.callAsync("device/stream_is_busy", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Gets the maximum speed of the live stream.
     Converts the units using the first axis of the stream.

     - Parameters:
        - unit: Units of velocity.

     - Returns: The maximum speed of the stream.
     */
    public func getMaxSpeed(unit: Units = Units.native) async throws -> Double {
        var request = DtoRequests.StreamGetMaxSpeedRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.unit = unit

        let response = try await Gateway.callAsync("device/stream_get_max_speed", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Sets the maximum speed of the live stream.
     Converts the units using the first axis of the stream.

     - Parameters:
        - maxSpeed: Maximum speed at which any stream action is executed.
        - unit: Units of velocity.
     */
    public func setMaxSpeed(maxSpeed: Double, unit: Units = Units.native) async throws  {
        var request = DtoRequests.StreamSetMaxSpeedRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.maxSpeed = maxSpeed
        request.unit = unit

        try await Gateway.callAsync("device/stream_set_max_speed", request)
    }

    /**
     Module: ZaberMotionAscii

     Gets the maximum tangential acceleration of the live stream.
     Converts the units using the first axis of the stream.

     - Parameters:
        - unit: Units of acceleration.

     - Returns: The maximum tangential acceleration of the live stream.
     */
    public func getMaxTangentialAcceleration(unit: Units = Units.native) async throws -> Double {
        var request = DtoRequests.StreamGetMaxTangentialAccelerationRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.unit = unit

        let response = try await Gateway.callAsync("device/stream_get_max_tangential_acceleration", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Sets the maximum tangential acceleration of the live stream.
     Converts the units using the first axis of the stream.

     - Parameters:
        - maxTangentialAcceleration: Maximum tangential acceleration at which any stream action is executed.
        - unit: Units of acceleration.
     */
    public func setMaxTangentialAcceleration(maxTangentialAcceleration: Double, unit: Units = Units.native) async throws  {
        var request = DtoRequests.StreamSetMaxTangentialAccelerationRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.maxTangentialAcceleration = maxTangentialAcceleration
        request.unit = unit

        try await Gateway.callAsync("device/stream_set_max_tangential_acceleration", request)
    }

    /**
     Module: ZaberMotionAscii

     Gets the maximum centripetal acceleration of the live stream.
     Converts the units using the first axis of the stream.

     - Parameters:
        - unit: Units of acceleration.

     - Returns: The maximum centripetal acceleration of the live stream.
     */
    public func getMaxCentripetalAcceleration(unit: Units = Units.native) async throws -> Double {
        var request = DtoRequests.StreamGetMaxCentripetalAccelerationRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.unit = unit

        let response = try await Gateway.callAsync("device/stream_get_max_centripetal_acceleration", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Sets the maximum centripetal acceleration of the live stream.
     Converts the units using the first axis of the stream.

     - Parameters:
        - maxCentripetalAcceleration: Maximum centripetal acceleration at which any stream action is executed.
        - unit: Units of acceleration.
     */
    public func setMaxCentripetalAcceleration(maxCentripetalAcceleration: Double, unit: Units = Units.native) async throws  {
        var request = DtoRequests.StreamSetMaxCentripetalAccelerationRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.maxCentripetalAcceleration = maxCentripetalAcceleration
        request.unit = unit

        try await Gateway.callAsync("device/stream_set_max_centripetal_acceleration", request)
    }

    /**
     Module: ZaberMotionAscii

     Returns a string which represents the stream.

     - Returns: String which represents the stream.
     */
    public func toString() throws -> String {
        var request = DtoRequests.StreamEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId

        let response = try Gateway.callSync("device/stream_to_string", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Disables the stream.
     If the stream is not setup, this command does nothing.
     Once disabled, the stream will no longer accept stream commands.
     The stream will process the rest of the commands in the queue until it is empty.
     */
    public func disable() async throws  {
        var request = DtoRequests.StreamEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId

        try await Gateway.callAsync("device/stream_disable", request)
    }

    /**
     Module: ZaberMotionAscii

     Sends a generic ASCII command to the stream.
     Keeps resending the command while the device rejects with AGAIN reason.

     - Parameters:
        - command: Command and its parameters.
     */
    public func genericCommand(command: String) async throws  {
        var request = DtoRequests.StreamGenericCommandRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.command = command

        try await Gateway.callAsync("device/stream_generic_command", request)
    }

    /**
     Module: ZaberMotionAscii

     Sends a batch of generic ASCII commands to the stream.
     Keeps resending command while the device rejects with AGAIN reason.
     The batch is atomic in terms of thread safety.

     - Parameters:
        - batch: Array of commands.
     */
    public func genericCommandBatch(batch: [String]) async throws  {
        var request = DtoRequests.StreamGenericCommandBatchRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.batch = batch

        try await Gateway.callAsync("device/stream_generic_command_batch", request)
    }

    /**
     Module: ZaberMotionAscii

     Queries the stream status from the device
     and returns boolean indicating whether the stream is disabled.
     Useful to determine if streaming was interrupted by other movements.

     - Returns: True if the stream is disabled.
     */
    public func checkDisabled() async throws -> Bool {
        var request = DtoRequests.StreamEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId

        let response = try await Gateway.callAsync("device/stream_check_disabled", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Makes the stream throw StreamDiscontinuityException when it encounters discontinuities (ND warning flag).
     */
    public func treatDiscontinuitiesAsError() throws  {
        var request = DtoRequests.StreamEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId

        try Gateway.callSync("device/stream_treat_discontinuities", request)
    }

    /**
     Module: ZaberMotionAscii

     Prevents StreamDiscontinuityException as a result of expected discontinuity when resuming streaming.
     */
    public func ignoreCurrentDiscontinuity() throws  {
        var request = DtoRequests.StreamEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId

        try Gateway.callSync("device/stream_ignore_discontinuity", request)
    }

    /**
     Module: ZaberMotionAscii

     Wait for a digital input channel to reach a given value.

     - Parameters:
        - channelNumber: The number of the digital input channel.
          Channel numbers are numbered from one.
        - value: The value that the stream should wait for.
     */
    @available(*, deprecated, message: "Use Stream.Io.WaitDigitalInput instead.")
    public func waitDigitalInput(channelNumber: Int, value: Bool) async throws  {
        var request = DtoRequests.StreamWaitDigitalInputRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.channelNumber = channelNumber
        request.value = value

        try await Gateway.callAsync("device/stream_wait_digital_input", request)
    }

    /**
     Module: ZaberMotionAscii

     Wait for the value of a analog input channel to reach a condition concerning a given value.

     - Parameters:
        - channelNumber: The number of the analog input channel.
          Channel numbers are numbered from one.
        - condition: A condition (e.g. <, <=, ==, !=).
        - value: The value that the condition concerns, in Volts.
     */
    @available(*, deprecated, message: "Use Stream.Io.WaitAnalogInput instead.")
    public func waitAnalogInput(channelNumber: Int, condition: String, value: Double) async throws  {
        var request = DtoRequests.StreamWaitAnalogInputRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.channelNumber = channelNumber
        request.condition = condition
        request.value = value

        try await Gateway.callAsync("device/stream_wait_analog_input", request)
    }

    /**
     Module: ZaberMotionAscii

     Sets value for the specified digital output channel.

     - Parameters:
        - channelNumber: Channel number starting at 1.
        - value: The type of action to perform on the channel.
     */
    @available(*, deprecated, message: "Use Stream.Io.SetDigitalOutput instead.")
    public func setDigitalOutput(channelNumber: Int, value: DigitalOutputAction) async throws  {
        var request = DtoRequests.StreamSetDigitalOutputRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.channelNumber = channelNumber
        request.value = value

        try await Gateway.callAsync("device/stream_set_digital_output", request)
    }

    /**
     Module: ZaberMotionAscii

     Sets values for all digital output channels.

     - Parameters:
        - values: The type of action to perform on the channel.
     */
    @available(*, deprecated, message: "Use Stream.Io.SetAllDigitalOutputs instead.")
    public func setAllDigitalOutputs(values: [DigitalOutputAction]) async throws  {
        var request = DtoRequests.StreamSetAllDigitalOutputsRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.values = values

        try await Gateway.callAsync("device/stream_set_all_digital_outputs", request)
    }

    /**
     Module: ZaberMotionAscii

     Sets value for the specified analog output channel.

     - Parameters:
        - channelNumber: Channel number starting at 1.
        - value: Value to set the output channel voltage to.
     */
    @available(*, deprecated, message: "Use Stream.Io.setAnalogOutput instead.")
    public func setAnalogOutput(channelNumber: Int, value: Double) async throws  {
        var request = DtoRequests.StreamSetAnalogOutputRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.channelNumber = channelNumber
        request.value = value

        try await Gateway.callAsync("device/stream_set_analog_output", request)
    }

    /**
     Module: ZaberMotionAscii

     Sets values for all analog output channels.

     - Parameters:
        - values: Voltage values to set the output channels to.
     */
    @available(*, deprecated, message: "Use Stream.Io.setAllAnalogOutputs instead.")
    public func setAllAnalogOutputs(values: [Double]) async throws  {
        var request = DtoRequests.StreamSetAllAnalogOutputsRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId
        request.values = values

        try await Gateway.callAsync("device/stream_set_all_analog_outputs", request)
    }

    /**
     Module: ZaberMotionAscii

     Gets the axes of the stream.

     - Returns: An array of axis numbers of the axes the stream is set up to control.
     */
    func retrieveAxes() throws -> [StreamAxisDefinition] {
        var request = DtoRequests.StreamEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId

        let response = try Gateway.callSync("device/stream_get_axes", request, DtoRequests.StreamGetAxesResponse.fromByteArray)
        return response.axes
    }

    /**
     Module: ZaberMotionAscii

     Get the mode of the stream.

     - Returns: Mode of the stream.
     */
    func retrieveMode() throws -> StreamMode {
        var request = DtoRequests.StreamEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.streamId

        let response = try Gateway.callSync("device/stream_get_mode", request, DtoRequests.StreamModeResponse.fromByteArray)
        return response.streamMode
    }

}
