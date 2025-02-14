// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Dto
import DtoRequests
import Gateway
import ZaberMotionExceptions

/**
 A handle for a PVT sequence with this number on the device.
 PVT sequences provide a way execute or store trajectory
 consisting of points with defined position, velocity, and time.
 PVT sequence methods append actions to a queue which executes
 or stores actions in a first in, first out order.
 */
public final class PvtSequence {

    public init(device: Device, pvtId: Int) {
        self.device = device
        self.pvtId = pvtId
        self.io = PvtIo(device: device, streamId: pvtId)
    }

    /**
     Device that controls this PVT sequence.
     */
    public let device: Device

    /**
     The number that identifies the PVT sequence on the device.
     */
    public let pvtId: Int

    /**
     Current mode of the PVT sequence.
     */
    public var mode: PvtMode {
        get throws { return try retrieveMode() }
    }

    /**
     An array of axes definitions the PVT sequence is set up to control.
     */
    public var axes: [PvtAxisDefinition] {
        get throws { return try retrieveAxes() }
    }

    /**
     Gets an object that provides access to I/O for this sequence.
     */
    public let io: PvtIo

    /**
     Setup the PVT sequence to control the specified axes and to queue actions on the device.
     Allows use of lockstep axes in a PVT sequence.

     - Parameters:
        - pvtAxes: Definition of the PVT sequence axes.
     */
    public func setupLiveComposite(_ pvtAxes: PvtAxisDefinition...) async throws  {
        var request = DtoRequests.StreamSetupLiveCompositeRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true
        request.pvtAxes = pvtAxes

        try await Gateway.callAsync("device/stream_setup_live_composite", request)
    }

    /**
     Setup the PVT sequence to control the specified axes and to queue actions on the device.

     - Parameters:
        - axes: Numbers of physical axes to setup the PVT sequence on.
     */
    public func setupLive(_ axes: Int...) async throws  {
        var request = DtoRequests.StreamSetupLiveRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true
        request.axes = axes

        try await Gateway.callAsync("device/stream_setup_live", request)
    }

    /**
     Setup the PVT sequence to use the specified axes and queue actions into a PVT buffer.
     Allows use of lockstep axes in a PVT sequence.

     - Parameters:
        - pvtBuffer: The PVT buffer to queue actions in.
        - pvtAxes: Definition of the PVT sequence axes.
     */
    public func setupStoreComposite(pvtBuffer: PvtBuffer, _ pvtAxes: PvtAxisDefinition...) async throws  {
        var request = DtoRequests.StreamSetupStoreCompositeRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true
        request.pvtBuffer = pvtBuffer.bufferId
        request.pvtAxes = pvtAxes

        try await Gateway.callAsync("device/stream_setup_store_composite", request)
    }

    /**
     Setup the PVT sequence to use the specified axes and queue actions into a PVT buffer.

     - Parameters:
        - pvtBuffer: The PVT buffer to queue actions in.
        - axes: Numbers of physical axes to setup the PVT sequence on.
     */
    public func setupStore(pvtBuffer: PvtBuffer, _ axes: Int...) async throws  {
        var request = DtoRequests.StreamSetupStoreRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true
        request.pvtBuffer = pvtBuffer.bufferId
        request.axes = axes

        try await Gateway.callAsync("device/stream_setup_store", request)
    }

    /**
     Append the actions in a PVT buffer to the sequence's queue.

     - Parameters:
        - pvtBuffer: The PVT buffer to call.
     */
    public func call(pvtBuffer: PvtBuffer) async throws  {
        var request = DtoRequests.StreamCallRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true
        request.pvtBuffer = pvtBuffer.bufferId

        try await Gateway.callAsync("device/stream_call", request)
    }

    /**
     Queues a point with absolute coordinates in the PVT sequence.
     If some or all velocities are not provided, the sequence calculates the velocities
     from surrounding points using finite difference.
     The last point of the sequence must have defined velocity (likely zero).

     - Parameters:
        - positions: Positions for the axes to move through, relative to their home positions.
        - velocities: The axes velocities at the given point.
          Specify an empty array or null for specific axes to make the sequence calculate the velocity.
        - time: The duration between the previous point in the sequence and this one.
     */
    public func point(positions: [Measurement], velocities: [Measurement?], time: Measurement) async throws  {
        var request = DtoRequests.PvtPointRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true
        request.type = DtoRequests.StreamSegmentType.abs
        request.positions = positions
        request.velocities = velocities
        request.time = time

        try await Gateway.callAsync("device/stream_point", request)
    }

    /**
     Queues a point with coordinates relative to the previous point in the PVT sequence.
     If some or all velocities are not provided, the sequence calculates the velocities
     from surrounding points using finite difference.
     The last point of the sequence must have defined velocity (likely zero).

     - Parameters:
        - positions: Positions for the axes to move through, relative to the previous point.
        - velocities: The axes velocities at the given point.
          Specify an empty array or null for specific axes to make the sequence calculate the velocity.
        - time: The duration between the previous point in the sequence and this one.
     */
    public func pointRelative(positions: [Measurement], velocities: [Measurement?], time: Measurement) async throws  {
        var request = DtoRequests.PvtPointRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true
        request.type = DtoRequests.StreamSegmentType.rel
        request.positions = positions
        request.velocities = velocities
        request.time = time

        try await Gateway.callAsync("device/stream_point", request)
    }

    /**
     Waits until the live PVT sequence executes all queued actions.

     - Parameters:
        - throwErrorOnFault: Determines whether to throw error when fault is observed.
     */
    public func waitUntilIdle(throwErrorOnFault: Bool = true) async throws  {
        var request = DtoRequests.StreamWaitUntilIdleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true
        request.throwErrorOnFault = throwErrorOnFault

        try await Gateway.callAsync("device/stream_wait_until_idle", request)
    }

    /**
     Cork the front of the PVT sequences's action queue, blocking execution.
     Execution resumes upon uncorking the queue, or when the number of queued actions reaches its limit.
     Corking eliminates discontinuities in motion due to subsequent PVT commands reaching the device late.
     You can only cork an idle live PVT sequence.
     */
    public func cork() async throws  {
        var request = DtoRequests.StreamEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true

        try await Gateway.callAsync("device/stream_cork", request)
    }

    /**
     Uncork the front of the queue, unblocking command execution.
     You can only uncork an idle live PVT sequence that is corked.
     */
    public func uncork() async throws  {
        var request = DtoRequests.StreamEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true

        try await Gateway.callAsync("device/stream_uncork", request)
    }

    /**
     Returns a boolean value indicating whether the live PVT sequence is executing a queued action.

     - Returns: True if the PVT sequence is executing a queued action.
     */
    public func isBusy() async throws -> Bool {
        var request = DtoRequests.StreamEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true

        let response = try await Gateway.callAsync("device/stream_is_busy", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Returns a string which represents the PVT sequence.

     - Returns: String which represents the PVT sequence.
     */
    public func toString() throws -> String {
        var request = DtoRequests.StreamEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true

        let response = try Gateway.callSync("device/stream_to_string", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    /**
     Disables the PVT sequence.
     If the PVT sequence is not setup, this command does nothing.
     Once disabled, the PVT sequence will no longer accept PVT commands.
     The PVT sequence will process the rest of the commands in the queue until it is empty.
     */
    public func disable() async throws  {
        var request = DtoRequests.StreamEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true

        try await Gateway.callAsync("device/stream_disable", request)
    }

    /**
     Sends a generic ASCII command to the PVT sequence.
     Keeps resending the command while the device rejects with AGAIN reason.

     - Parameters:
        - command: Command and its parameters.
     */
    public func genericCommand(command: String) async throws  {
        var request = DtoRequests.StreamGenericCommandRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true
        request.command = command

        try await Gateway.callAsync("device/stream_generic_command", request)
    }

    /**
     Sends a batch of generic ASCII commands to the PVT sequence.
     Keeps resending command while the device rejects with AGAIN reason.
     The batch is atomic in terms of thread safety.

     - Parameters:
        - batch: Array of commands.
     */
    public func genericCommandBatch(batch: [String]) async throws  {
        var request = DtoRequests.StreamGenericCommandBatchRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true
        request.batch = batch

        try await Gateway.callAsync("device/stream_generic_command_batch", request)
    }

    /**
     Queries the PVT sequence status from the device
     and returns boolean indicating whether the PVT sequence is disabled.
     Useful to determine if execution was interrupted by other movements.

     - Returns: True if the PVT sequence is disabled.
     */
    public func checkDisabled() async throws -> Bool {
        var request = DtoRequests.StreamEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true

        let response = try await Gateway.callAsync("device/stream_check_disabled", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Makes the PVT sequence throw PvtDiscontinuityException when it encounters discontinuities (ND warning flag).
     */
    public func treatDiscontinuitiesAsError() throws  {
        var request = DtoRequests.StreamEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true

        try Gateway.callSync("device/stream_treat_discontinuities", request)
    }

    /**
     Prevents PvtDiscontinuityException as a result of expected discontinuity when resuming the sequence.
     */
    public func ignoreCurrentDiscontinuity() throws  {
        var request = DtoRequests.StreamEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true

        try Gateway.callSync("device/stream_ignore_discontinuity", request)
    }

    /**
     Sets value for the specified digital output channel.

     - Parameters:
        - channelNumber: Channel number starting at 1.
        - value: The type of action to perform on the channel.
     */
    @available(*, deprecated, message: "Use PvtSequence.Io.SetDigitalOutput instead.")
    public func setDigitalOutput(channelNumber: Int, value: DigitalOutputAction) async throws  {
        var request = DtoRequests.StreamSetDigitalOutputRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true
        request.channelNumber = channelNumber
        request.value = value

        try await Gateway.callAsync("device/stream_set_digital_output", request)
    }

    /**
     Sets values for all digital output channels.

     - Parameters:
        - values: The type of action to perform on the channel.
     */
    @available(*, deprecated, message: "Use PvtSequence.Io.SetAllDigitalOutputs instead.")
    public func setAllDigitalOutputs(values: [DigitalOutputAction]) async throws  {
        var request = DtoRequests.StreamSetAllDigitalOutputsRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true
        request.values = values

        try await Gateway.callAsync("device/stream_set_all_digital_outputs", request)
    }

    /**
     Sets value for the specified analog output channel.

     - Parameters:
        - channelNumber: Channel number starting at 1.
        - value: Value to set the output channel voltage to.
     */
    @available(*, deprecated, message: "Use PvtSequence.Io.SetAnalogOutput instead.")
    public func setAnalogOutput(channelNumber: Int, value: Double) async throws  {
        var request = DtoRequests.StreamSetAnalogOutputRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true
        request.channelNumber = channelNumber
        request.value = value

        try await Gateway.callAsync("device/stream_set_analog_output", request)
    }

    /**
     Sets values for all analog output channels.

     - Parameters:
        - values: Voltage values to set the output channels to.
     */
    @available(*, deprecated, message: "Use PvtSequence.Io.SetAllAnalogOutputs instead.")
    public func setAllAnalogOutputs(values: [Double]) async throws  {
        var request = DtoRequests.StreamSetAllAnalogOutputsRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true
        request.values = values

        try await Gateway.callAsync("device/stream_set_all_analog_outputs", request)
    }

    /**
     Gets the axes of the PVT sequence.

     - Returns: An array of axis numbers of the axes the PVT sequence is set up to control.
     */
    func retrieveAxes() throws -> [PvtAxisDefinition] {
        var request = DtoRequests.StreamEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true

        let response = try Gateway.callSync("device/stream_get_axes", request, DtoRequests.StreamGetAxesResponse.fromByteArray)
        return response.pvtAxes
    }

    /**
     Get the mode of the PVT sequence.

     - Returns: Mode of the PVT sequence.
     */
    func retrieveMode() throws -> PvtMode {
        var request = DtoRequests.StreamEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true

        let response = try Gateway.callSync("device/stream_get_mode", request, DtoRequests.StreamModeResponse.fromByteArray)
        return response.pvtMode
    }

}

