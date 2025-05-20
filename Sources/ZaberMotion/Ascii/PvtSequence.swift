// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Dto
import DtoAscii
import DtoRequests
import Gateway
import ZaberMotionExceptions
import Utils

/**
 Module: ZaberMotionAscii

 A handle for a PVT sequence with this number on the device.
 PVT sequences provide a way execute or store trajectory
 consisting of points with defined position, velocity, and time.
 PVT sequence methods append actions to a queue which executes
 or stores actions in a first in, first out order.
 */
public final class PvtSequence: @unchecked Sendable {

    package init(device: Device, pvtId: Int) {
        self.device = device
        self.pvtId = pvtId
        self.io = PvtIo(device: device, streamId: pvtId)
    }

    /**
     Module: ZaberMotionAscii

     Device that controls this PVT sequence.
     */
    public let device: Device

    /**
     Module: ZaberMotionAscii

     The number that identifies the PVT sequence on the device.
     */
    public let pvtId: Int

    /**
     Module: ZaberMotionAscii

     Current mode of the PVT sequence.
     */
    public var mode: PvtMode {
        get throws { return try retrieveMode() }
    }

    /**
     Module: ZaberMotionAscii

     An array of axes definitions the PVT sequence is set up to control.
     */
    public var axes: [PvtAxisDefinition] {
        get throws { return try retrieveAxes() }
    }

    /**
     Module: ZaberMotionAscii

     Gets an object that provides access to I/O for this sequence.
     */
    public let io: PvtIo

    /**
     Module: ZaberMotionAscii

     Generates velocities for a sequence of positions and times, and (optionally) a partially defined sequence
     of velocities. Note that if some velocities are defined, the solver will NOT modify them in any way.
     If all velocities are defined, the solver will simply return the same velocities.
     This function calculates velocities by enforcing that acceleration be continuous at each segment transition.

     Also note that if generating a path for multiple axes, the user must provide a position measurement sequence
     per axis, And the values arrays for each sequence must be equal in length to each other and also to the
     times sequence.

     - Parameters:
        - positions: Positions for the axes to move through, relative to their home positions.
          Each MeasurementSequence represents a sequence of positions along a particular dimension.
          For example, a 2D path sequence would contain two MeasurementSequence objects,
          one representing positions along X and one for those along Y.
        - times: The relative or absolute time of each position in the PVT sequence.
        - velocities: Optional velocities corresponding to each point in the position sequences.
        - timesRelative: If true, the times sequence values are interpreted as relative. Otherwise,
          they are interpreted as absolute. Note that the values of the returned time
          sequence are ALWAYS relative. This is because the PVT sequence API expects
          points to have relative times.

     - Returns: Object containing the generated PVT sequence. Note that returned time sequence is always relative.
     */
    public static func generateVelocities(positions: [MeasurementSequence], times: MeasurementSequence, velocities: [OptionalMeasurementSequence] = [], timesRelative: Bool = true) async throws -> PvtSequenceData {
        _assertSendable(PvtSequenceData.self)

        var request = DtoRequests.PvtGenerateVelocitiesRequest()
        request.positions = positions
        request.times = times
        request.velocities = velocities
        request.timesRelative = timesRelative

        return try await Gateway.callAsync("device/pvt_generate_velocities", request, PvtSequenceData.fromByteArray)
    }

    /**
     Module: ZaberMotionAscii

     Generates positions for a sequence of velocities and times. This function calculates
     positions by enforcing that acceleration be continuous at each segment transition.

     Note that if generating a path for multiple axes, the user must provide a
     velocity measurement sequence per axis, and the values arrays for each sequence
     must be equal in length to each other and also to the times sequence.

     - Parameters:
        - velocities: The sequence of velocities for each axis.
          Each MeasurementSequence represents a sequence of velocities along particular dimension.
        - times: The relative or absolute time of each position in the PVT sequence.
        - timesRelative: If true, the times sequence values are interpreted as relative. Otherwise,
          they are interpreted as absolute. Note that the values of the returned time
          sequence are ALWAYS relative. This is because the PVT sequence API expects
          points to have relative times.

     - Returns: Object containing the generated PVT sequence. Note that returned time sequence is always relative.
     */
    public static func generatePositions(velocities: [MeasurementSequence], times: MeasurementSequence, timesRelative: Bool = true) async throws -> PvtSequenceData {
        _assertSendable(PvtSequenceData.self)

        var request = DtoRequests.PvtGeneratePositionsRequest()
        request.velocities = velocities
        request.times = times
        request.timesRelative = timesRelative

        return try await Gateway.callAsync("device/pvt_generate_positions", request, PvtSequenceData.fromByteArray)
    }

    /**
     Module: ZaberMotionAscii

     Saves PvtSequenceData object as csv file.
     Save format is compatible with Zaber Launcher PVT Editor App.

     Throws InvalidArgumentException if fields are undefined or inconsistent.
     For example, position and velocity arrays must have the same dimensions.
     Sequence lengths must be consistent for positions, velocities and times.

     - Parameters:
        - sequenceData: The PVT sequence data to save.
        - path: The path to save the file to.
        - dimensionNames: Optional csv column names for each series.
          If not provided, the default names will be used: Series 1, Series 2, etc..
          Length of this array must be equal to number of dimensions in sequence data.
     */
    public static func saveSequenceData(sequenceData: PvtSequenceData, path: String, dimensionNames: [String] = []) async throws  {
        var request = DtoRequests.PvtSaveCsvRequest()
        request.sequenceData = sequenceData
        request.path = path
        request.dimensionNames = dimensionNames

        try await Gateway.callAsync("device/stream_pvt_save_csv", request)
    }

    /**
     Module: ZaberMotionAscii

     Load PVT Sequence data from CSV file.
     The CSV data can include a header (recommended).
     There are two possible header formats:

     1. A time column with named position and velocity columns.
     For example, "Time (ms),X Position (cm),X Velocity (cm/s),...".
     In this case, position, velocity and time columns are all optional.
     Also, order does not matter, but position and velocity names must be consistent.
     This is our recommended CSV format.

     2. A time column with alternating position and velocity columns.
     For example, "Time (ms),Position (cm),Velocity (cm/s),...".
     In this case, only the time column is optional and order does matter.

     Units must be wrapped in parens or square braces: ie. (µm/s), [µm/s].
     Additionally, native units are the default if no units are specified.
     If no header is included, then column order is assumed to be "T,P1,V1,P2,V2,...".
     In this case the number of columns must be odd.

     - Parameters:
        - path: The path from which the csv file will be loaded.

     - Returns: The PVT csv data loaded from the file.
     */
    public static func loadSequenceData(path: String) async throws -> PvtCsvData {
        _assertSendable(PvtCsvData.self)

        var request = DtoRequests.PvtLoadCsvRequest()
        request.path = path

        return try await Gateway.callAsync("device/stream_pvt_load_csv", request, PvtCsvData.fromByteArray)
    }

    /**
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

     Queues points with absolute coordinates in the PVT sequence.

     - Parameters:
        - positions: Per-axis sequences of positions.
        - velocities: Per-axis sequences of velocities.
          For velocities [v0, v1, ...] and positions [p0, p1, ...], v1 is the target velocity at point p1.
        - times: Segment times from one point to another.
          For times [t0, t1, ...] and positions [p0, p1, ...], t1 is the time it takes to move from p0 to p1.
     */
    public func points(positions: [MeasurementSequence], velocities: [MeasurementSequence], times: MeasurementSequence) async throws  {
        var request = DtoRequests.PvtPointsRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true
        request.type = DtoRequests.StreamSegmentType.abs
        request.positions = positions
        request.velocities = velocities
        request.times = times

        try await Gateway.callAsync("device/stream_points", request)
    }

    /**
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

     Queues points with coordinates relative to the previous point in the PVT sequence.

     - Parameters:
        - positions: Per-axis sequences of positions.
        - velocities: Per-axis sequences of velocities.
          For velocities [v0, v1, ...] and positions [p0, p1, ...], v1 is the target velocity at point p1.
        - times: Segment times from one point to another.
          For times [t0, t1, ...] and positions [p0, p1, ...], t1 is the time it takes to move from p0 to p1.
     */
    public func pointsRelative(positions: [MeasurementSequence], velocities: [MeasurementSequence], times: MeasurementSequence) async throws  {
        var request = DtoRequests.PvtPointsRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true
        request.type = DtoRequests.StreamSegmentType.rel
        request.positions = positions
        request.velocities = velocities
        request.times = times

        try await Gateway.callAsync("device/stream_points", request)
    }

    /**
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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

