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
     The function does not modify the input positions or times.

     Also note that if the first position is relative, all following points must be relative.
     If the start position is absolute, then the sequence can include a mix of relative and absolute positions.
     Additionally, all times must be relative to the previous point.
     Please see the ConvertTimeAbsoluteToRelativePartial function for conversions.

     Does not support native units.

     - Parameters:
        - sequenceItems: Partial PVT points defining the positions, optional velocities, and times for the sequence.
          Each point should have positions defined for each axis. Velocities are optional.
          Times must be defined for each point.

     - Returns: Array of points and actions containing the generated PVT sequence. Note returned times are always relative.
     */
    public static func generateVelocities(sequenceItems: [PvtPartialSequenceItem]) async throws -> [PvtSequenceItem] {
        _assertSendable(PvtSequenceItem.self)

        var request = DtoRequests.PvtGenerateVelocitiesRequest()
        request.sequenceItems = sequenceItems

        let response = try await Gateway.callAsync("device/pvt_generate_velocities", request, DtoRequests.PvtGenerateSequenceResponse.fromByteArray)
        return response.sequenceData
    }

    /**
     Module: ZaberMotionAscii

     Generates positions for a sequence of velocities and times. This function calculates
     positions by enforcing that acceleration be continuous at each segment transition.

     This function does not modify the input velocities or times, and outputs absolute
     positions. If your initial point has a time of zero, it will be considered a starting
     position when submitted to the device, and you must already have moved the device
     to that position. Additionally, all times must be relative to the previous point.
     Please see the ConvertTimeAbsoluteToRelativePartial function for conversions.

     Does not support native units.

     - Parameters:
        - sequenceItems: Partial PVT points defining the velocities and times for the sequence.
          Each point should have velocities defined for each axis.
          Times must be defined for each point.

     - Returns: Array of points and actions containing the generated PVT sequence. Note returned times are always relative.
     */
    public static func generatePositions(sequenceItems: [PvtPartialSequenceItem]) async throws -> [PvtSequenceItem] {
        _assertSendable(PvtSequenceItem.self)

        var request = DtoRequests.PvtGeneratePositionsRequest()
        request.sequenceItems = sequenceItems

        let response = try await Gateway.callAsync("device/pvt_generate_positions", request, DtoRequests.PvtGenerateSequenceResponse.fromByteArray)
        return response.sequenceData
    }

    /**
     Module: ZaberMotionAscii

     Generates sequences of velocities and times for a sequence of positions.
     This function fits a geometric spline (not-a-knot cubic for sequences of >3 points,
     natural cubic for 3, and a straight line for 2) over the position sequence
     and then calculates the velocity and time information by traversing it using a
     trapezoidal motion profile.

     This generation scheme attempts to keep speed and acceleration less than the
     specified target values, but does not guarantee it. Generally speaking, a higher
     resample number will bring the generated trajectory closer to respecting these
     limits.

     Note that consecutive duplicate points will be automatically removed as they
     have no geometric significance without additional time information. Also note that
     for multi-dimensional paths this function expects axes to be linear and orthogonal,
     however for paths of a single dimension rotary units are accepted.
     Additionally, if the first positions of the input sequence is relative,
     all following positions must also be relative. If the first position is absolute,
     the sequence may contain a mix of relative and absolute positions.
     Resampling a sequence which contains relative positions is not allowed.

     This function outputs points with absolute positions and relative times, with the
     first time equal to zero, meaning it will be treated as a start position when
     executing on a device. You must move the device to that position before submitting
     the sequence, or change the first point's time to a value greater than zero.

     Does not support native units.

     - Parameters:
        - sequenceItems: Partial PVT points defining the positions for the sequence.
          Each point should have positions defined for each axis.
        - targetSpeed: The target speed used to generate positions and times.
        - targetAcceleration: The target acceleration used to generate positions and times.
        - resampleNumber: The number of points to resample the sequence by.
          Leave undefined to use the specified points.

     - Returns: Array of points and actions containing the generated PVT sequence. Note returned times are always relative.
     */
    public static func generateVelocitiesAndTimes(sequenceItems: [PvtPartialSequenceItem], targetSpeed: Measurement, targetAcceleration: Measurement, resampleNumber: Int? = nil) async throws -> [PvtSequenceItem] {
        _assertSendable(PvtSequenceItem.self)

        guard targetSpeed.value > 0 && targetAcceleration.value > 0 else {
            throw ZaberMotionExceptions.InvalidArgumentException(message: "Target speed and acceleration values must be greater than zero.")
        }

        var request = DtoRequests.PvtGenerateVelocitiesAndTimesRequest()
        request.sequenceItems = sequenceItems
        request.targetSpeed = targetSpeed
        request.targetAcceleration = targetAcceleration
        request.resampleNumber = resampleNumber

        let response = try await Gateway.callAsync("device/pvt_generate_velocities_and_times", request, DtoRequests.PvtGenerateSequenceResponse.fromByteArray)
        return response.sequenceData
    }

    /**
     Module: ZaberMotionAscii

     Saves PvtSequenceItem array as a csv file.
     Save format is compatible with Zaber Launcher PVT Editor App.

     Normally a sequence in memory should have relative time values on the points.
     If you want to store absolute times instead, you can use the
     ConvertTimeRelativeToAbsolute function to convert before saving.

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
    public static func saveSequenceData(sequenceData: [PvtSequenceItem], path: String, dimensionNames: [String] = []) async throws  {
        var request = DtoRequests.PvtSaveCsvRequest()
        request.sequenceData = sequenceData
        request.path = path
        request.dimensionNames = dimensionNames

        try await Gateway.callAsync("device/stream_pvt_save_csv", request)
    }

    /**
     Module: ZaberMotionAscii

     Load PVT Sequence data from CSV file.
     This function expects complete data in the CSV files (a time column and
     both position and velocity columns for each series).
     If your CSV file has partial data, use LoadPartialSequenceData instead.

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
     Time values default to milliseconds if no units are provided.
     If no header is included, then column order is assumed to be "T,P1,V1,P2,V2,...".
     In this case the number of columns must be odd.

     Users can add a column named "Relative" with true/false values to
     indicate whether each point's position is relative or absolute.
     If this column is not included, all points will be assumed to be absolute.

     If the first point has time = zero, it is considered the start position
     and treated specially. It must have an absolute position, and the device
     must already be idle at that position when the sequence is submitted.
     The velocity of the start position is ignored, and should normally be zero.
     Sequences with nonzero time for the first point do not have these constraints.

     Buffer calls and I/O actions can be added into the CSV file by
     adding a column titled "Actions", containing the ASCII protocol command(s)
     shortened by everything up to the PVT stream number, for example
     "call 2" or "io set do 1 1". If you want to insert multiple actions
     after a point, put them in the same cell separated by a semicolon.
     See the ASCII Protocol Manual
     [PVT command reference](https://www.zaber.com/protocol-manual?protocol=ASCII#topic_command_pvt)
     section for the list of available commands. Unit symbols are not supported;
     analog output voltages are always in volts and schedule delay times are
     always in milliseconds.

     Note that the Relative and Actions columns are not automatically
     detected, so if you include them you must include a header row.

     Time values should always be relative when sent to a device or to the
     various Generate... functions on this class. If you want to store
     absolute times in a CSV file, you can use the ConvertTimeRelativeToAbsolute
     function to convert after loading the file.

     - Parameters:
        - path: The path to the csv file to load.

     - Returns: The PVT csv data loaded from the file.
     */
    public static func loadSequenceData(path: String) async throws -> PvtCsvData {
        _assertSendable(PvtCsvData.self)

        var request = DtoRequests.PvtLoadCsvRequest()
        request.path = path

        let response = try await Gateway.callAsync("device/stream_pvt_load_csv", request, PvtCsvData.fromByteArray)
        return response
    }

    /**
     Module: ZaberMotionAscii

     Load PVT Sequence data from CSV file, allowing for some combinations of incomplete data.
     Output from this function cannot be enqueued on a device until the missing data has
     been filled in using the GenerateVelocities, GeneratePositions or
     GenerateVelocitiesAndTimes functions.

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
     Time values default to milliseconds if no units are provided.
     If no header is included, then column order is assumed to be "T,P1,V1,P2,V2,...".
     In this case the number of columns must be odd.

     Users can add a column named "Relative" with true/false values to
     indicate whether each point's position is relative or absolute.
     If this column is not included, all points will be assumed to be absolute.

     If the first point has time = zero, it is considered the start position
     and treated specially. It must have an absolute position, and the device
     must already be idle at that position when the sequence is submitted.
     The velocity of the start position is ignored, and should normally be zero.
     Sequences with nonzero time for the first point do not have these constraints.

     Buffer calls and I/O actions can be added into the CSV file by
     adding a column titled "Actions", containing the ASCII protocol command(s)
     shortened by everything up to the PVT stream number, for example
     "call 2" or "io set do 1 1". If you want to insert multiple actions
     after a point, put them in the same cell separated by a semicolon.
     See the ASCII Protocol Manual
     [PVT command reference](https://www.zaber.com/protocol-manual?protocol=ASCII#topic_command_pvt)
     section for the list of available commands. Unit symbols are not supported;
     analog output voltages are always in volts and schedule delay times are
     always in milliseconds.

     Note that the Relative and Actions columns are not automatically
     detected, so if you include them you must include a header row.

     Time values should always be relative when sent to a device or to the
     various Generate... functions on this class. If you want to store
     absolute times in a CSV file, you can use the ConvertTimeRelativeToAbsolute
     function to convert after loading the file.

     - Parameters:
        - path: The path to the csv file to load.

     - Returns: The PVT csv data loaded from the file.
     */
    public static func loadPartialSequenceData(path: String) async throws -> PvtPartialCsvData {
        _assertSendable(PvtPartialCsvData.self)

        var request = DtoRequests.PvtLoadCsvRequest()
        request.path = path

        let response = try await Gateway.callAsync("device/stream_pvt_load_partial_csv", request, PvtPartialCsvData.fromByteArray)
        return response
    }

    /**
     Module: ZaberMotionAscii

     Converts the time values in a PvtSequenceItem array from absolute to relative.
     Points passed to the Generate functions or sent to devices must have relative time values.

     - Parameters:
        - sequenceData: The sequence data for which to convert times from absolute to relative.
          Point times must all be in the same units.

     - Returns: The sequence data with times converted from absolute to relative.
     */
    public static func convertTimeAbsoluteToRelative(sequenceData: [PvtSequenceItem]) async throws -> [PvtSequenceItem] {
        _assertSendable(PvtSequenceItem.self)

        var request = DtoRequests.PvtConvertTimeRequest()
        request.fromAbsolute = true
        request.sequenceData = sequenceData

        let response = try await Gateway.callAsync("device/stream_pvt_convert_time", request, DtoRequests.PvtConvertTimeResponse.fromByteArray)
        return response.sequenceData
    }

    /**
     Module: ZaberMotionAscii

     Converts the time values in a PvtSequenceItem array from relative to absolute.

     - Parameters:
        - sequenceData: The sequence data for which to convert times from relative to absolute.
          Point times must all be in the same units.

     - Returns: The sequence data with times converted from relative to absolute.
     */
    public static func convertTimeRelativeToAbsolute(sequenceData: [PvtSequenceItem]) async throws -> [PvtSequenceItem] {
        _assertSendable(PvtSequenceItem.self)

        var request = DtoRequests.PvtConvertTimeRequest()
        request.fromAbsolute = false
        request.sequenceData = sequenceData

        let response = try await Gateway.callAsync("device/stream_pvt_convert_time", request, DtoRequests.PvtConvertTimeResponse.fromByteArray)
        return response.sequenceData
    }

    /**
     Module: ZaberMotionAscii

     Converts the time values in a PvtPartialSequenceItem array from absolute to relative.
     Points passed to the Generate functions or sent to devices must have relative time values.

     - Parameters:
        - sequenceData: The sequence data for which to convert times from absolute to relative.
          Point times must all be in the same units.

     - Returns: The sequence data with times converted from absolute to relative.
     */
    public static func convertTimeAbsoluteToRelativePartial(sequenceData: [PvtPartialSequenceItem]) async throws -> [PvtPartialSequenceItem] {
        _assertSendable(PvtPartialSequenceItem.self)

        var request = DtoRequests.PvtPartialConvertTimeRequest()
        request.fromAbsolute = true
        request.sequenceData = sequenceData

        let response = try await Gateway.callAsync("device/stream_pvt_convert_time_partial", request, DtoRequests.PvtPartialConvertTimeResponse.fromByteArray)
        return response.sequenceData
    }

    /**
     Module: ZaberMotionAscii

     Converts the time values in a PvtPartialSequenceItem array from relative to absolute.

     - Parameters:
        - sequenceData: The sequence data for which to convert times from relative to absolute.
          Point times must all be in the same units.

     - Returns: The sequence data with times converted from relative to absolute.
     */
    public static func convertTimeRelativeToAbsolutePartial(sequenceData: [PvtPartialSequenceItem]) async throws -> [PvtPartialSequenceItem] {
        _assertSendable(PvtPartialSequenceItem.self)

        var request = DtoRequests.PvtPartialConvertTimeRequest()
        request.fromAbsolute = false
        request.sequenceData = sequenceData

        let response = try await Gateway.callAsync("device/stream_pvt_convert_time_partial", request, DtoRequests.PvtPartialConvertTimeResponse.fromByteArray)
        return response.sequenceData
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
        request.pvtBuffer = pvtBuffer.bufferNumber
        request.pvtAxes = pvtAxes

        try await Gateway.callAsync("device/stream_setup_store_composite", request)
    }

    /**
     Module: ZaberMotionAscii

     Setup the PVT sequence to use the specified axes and queue actions into a PVT buffer.

     - Parameters:
        - pvtBuffer: The PVT buffer to queue actions in.
        - axes: The axis numbers of the physical axes to setup the PVT sequence on.
     */
    public func setupStore(pvtBuffer: PvtBuffer, _ axes: Int...) async throws  {
        var request = DtoRequests.StreamSetupStoreRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.pvt = true
        request.pvtBuffer = pvtBuffer.bufferNumber
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
        request.pvtBuffer = pvtBuffer.bufferNumber

        try await Gateway.callAsync("device/stream_call", request)
    }

    /**
     Module: ZaberMotionAscii

     Queues a point with absolute coordinates in the PVT sequence.
     If some or all velocities are not provided, the sequence calculates the velocities
     from surrounding points using finite difference.
     If time value is zero, the device must already be idle at the specified position
     and the specified velocity must be zero.
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
     Each point must have its time value measured relative to the previous point
     or unexpected behavior will result.

     Note that if the first time value is zero, the device must already be idle at
     the position of the first point and the velocity of that point must be zero.
     All other time values must be greater than zero.

     - Parameters:
        - positions: Per-axis sequences of positions.
        - velocities: Per-axis sequences of velocities.
          For velocities [v0, v1, ...] and positions [p0, p1, ...], v1 is the target velocity at point p1.
        - times: Segment times from one point to another.
          For times [t0, t1, ...] and positions [p0, p1, ...], t1 is the time it takes to move from p0 to p1.
     */
    @available(*, deprecated, message: "This method is being replaced by the new SubmitSequenceData method.")
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

     The time value must be greater than zero, and each point must have its time value
     measured relative to the previous point or unexpected behavior will result.

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
     All time values must be greater than zero and each point must have its time value
     measured relative to the previous point or unexpected behavior will result.

     - Parameters:
        - positions: Per-axis sequences of positions.
        - velocities: Per-axis sequences of velocities.
          For velocities [v0, v1, ...] and positions [p0, p1, ...], v1 is the target velocity at point p1.
        - times: Segment times from one point to another.
          For times [t0, t1, ...] and positions [p0, p1, ...], t1 is the time it takes to move from p0 to p1.
     */
    @available(*, deprecated, message: "This method is being replaced by the new SubmitSequenceData method.")
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

     Writes the contents of a PvtSequenceItem array to the sequence.
     Each point must have its time value measured relative to the previous point
     or unexpected behavior will result. If your point times are absolute (measured
     from the start of the sequence), use the ConvertTimeAbsoluteToRelative
     function to convert them before submitting.

     If the first point in the sequence has a time value of zero, it is
     considered the starting position. It must have an absolute position,
     zero velocity, and the device must already be idle at the specified position.

     - Parameters:
        - sequenceData: The PVT sequence data to submit.
     */
    public func submitSequenceData(sequenceData: [PvtSequenceItem]) async throws  {
        var request = DtoRequests.PvtSubmitSequenceDataRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = self.pvtId
        request.sequenceData = sequenceData

        try await Gateway.callAsync("device/stream_pvt_submit_sequence_data", request)
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
