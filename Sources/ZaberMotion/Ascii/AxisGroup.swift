// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import UnitsInternal
import Dto
import DtoRequests
import Gateway
import ZaberMotionExceptions

/**
 Groups multiple axes across devices into a single group to allow for simultaneous movement.
 Note that the movement is not coordinated and trajectory is inconsistent and not repeatable between calls.
 Make sure that any possible trajectory is clear of potential obstacles.
 The movement methods return after all the axes finish the movement successfully
 or throw an error as soon as possible.
 */
public final class AxisGroup {

    /**
     Initializes the group with the axes to be controlled.
     */
    public init(axes: [Axis]) {
        self.axes = axes
    }

    /**
     Axes of the group.
     */
    public let axes: [Axis]

    /**
     Homes the axes.
     */
    public func home() async throws  {
        var request = DtoRequests.AxesEmptyRequest()
        request.interfaces = axes.map { $0.device.connection.interfaceId }
        request.devices = axes.map { $0.device.deviceAddress }
        request.axes = axes.map { $0.axisNumber }

        try await Gateway.callAsync("axes/home", request)
    }

    /**
     Stops the axes.
     */
    public func stop() async throws  {
        var request = DtoRequests.AxesEmptyRequest()
        request.interfaces = axes.map { $0.device.connection.interfaceId }
        request.devices = axes.map { $0.device.deviceAddress }
        request.axes = axes.map { $0.axisNumber }

        try await Gateway.callAsync("axes/stop", request)
    }

    /**
     Moves the axes to absolute position.

     - Parameters:
        - position: Position.
     */
    public func moveAbsolute(_ position: Measurement...) async throws  {
        var request = DtoRequests.AxesMoveRequest()
        request.interfaces = axes.map { $0.device.connection.interfaceId }
        request.devices = axes.map { $0.device.deviceAddress }
        request.axes = axes.map { $0.axisNumber }
        request.position = position

        try await Gateway.callAsync("axes/move_absolute", request)
    }

    /**
     Move axes to position relative to the current position.

     - Parameters:
        - position: Position.
     */
    public func moveRelative(_ position: Measurement...) async throws  {
        var request = DtoRequests.AxesMoveRequest()
        request.interfaces = axes.map { $0.device.connection.interfaceId }
        request.devices = axes.map { $0.device.deviceAddress }
        request.axes = axes.map { $0.axisNumber }
        request.position = position

        try await Gateway.callAsync("axes/move_relative", request)
    }

    /**
     Moves axes to the minimum position as specified by limit.min.
     */
    public func moveMin() async throws  {
        var request = DtoRequests.AxesEmptyRequest()
        request.interfaces = axes.map { $0.device.connection.interfaceId }
        request.devices = axes.map { $0.device.deviceAddress }
        request.axes = axes.map { $0.axisNumber }

        try await Gateway.callAsync("axes/move_min", request)
    }

    /**
     Moves axes to the maximum position as specified by limit.max.
     */
    public func moveMax() async throws  {
        var request = DtoRequests.AxesEmptyRequest()
        request.interfaces = axes.map { $0.device.connection.interfaceId }
        request.devices = axes.map { $0.device.deviceAddress }
        request.axes = axes.map { $0.axisNumber }

        try await Gateway.callAsync("axes/move_max", request)
    }

    /**
     Waits until all the axes stop moving.
     */
    public func waitUntilIdle() async throws  {
        var request = DtoRequests.AxesEmptyRequest()
        request.interfaces = axes.map { $0.device.connection.interfaceId }
        request.devices = axes.map { $0.device.deviceAddress }
        request.axes = axes.map { $0.axisNumber }

        try await Gateway.callAsync("axes/wait_until_idle", request)
    }

    /**
     Returns bool indicating whether any of the axes is executing a motion command.

     - Returns: True if any of the axes is currently executing a motion command. False otherwise.
     */
    public func isBusy() async throws -> Bool {
        var request = DtoRequests.AxesEmptyRequest()
        request.interfaces = axes.map { $0.device.connection.interfaceId }
        request.devices = axes.map { $0.device.deviceAddress }
        request.axes = axes.map { $0.axisNumber }

        let response = try await Gateway.callAsync("axes/is_busy", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Returns bool indicating whether all the axes are homed.

     - Returns: True if all the axes are homed. False otherwise.
     */
    public func isHomed() async throws -> Bool {
        var request = DtoRequests.AxesEmptyRequest()
        request.interfaces = axes.map { $0.device.connection.interfaceId }
        request.devices = axes.map { $0.device.deviceAddress }
        request.axes = axes.map { $0.axisNumber }

        let response = try await Gateway.callAsync("axes/is_homed", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Returns current axes position.
     The positions are requested sequentially.
     The result position may not be accurate if the axes are moving.

     - Parameters:
        - unit: Units of position. You can specify units once or for each axis separately.

     - Returns: Axes position.
     */
    public func getPosition(_ unit: Units...) async throws -> [Double] {
        var request = DtoRequests.AxesGetSettingRequest()
        request.interfaces = axes.map { $0.device.connection.interfaceId }
        request.devices = axes.map { $0.device.deviceAddress }
        request.axes = axes.map { $0.axisNumber }
        request.setting = "pos"
        request.unit = unit

        let response = try await Gateway.callAsync("axes/get_setting", request, DtoRequests.DoubleArrayResponse.fromByteArray)
        return response.values
    }

    /**
     Returns a string that represents the axes.

     - Returns: A string that represents the axes.
     */
    public func toString() throws -> String {
        var request = DtoRequests.AxesEmptyRequest()
        request.interfaces = axes.map { $0.device.connection.interfaceId }
        request.devices = axes.map { $0.device.deviceAddress }
        request.axes = axes.map { $0.axisNumber }

        let response = try Gateway.callSync("axes/to_string", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

}
