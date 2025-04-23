// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import DtoRequests
import ZaberMotionExceptions
import Gateway
import ZaberMotionAscii

/**
 Module: ZaberMotionMicroscopy

 A generic turret device.
 */
public final class FilterChanger: @unchecked Sendable {

    /**
     Module: ZaberMotionMicroscopy

     Creates instance of `FilterChanger` based on the given device.
     */
    public init(device: Device) {
        self.device = device
    }

    /**
     Module: ZaberMotionMicroscopy

     The base device of this turret.
     */
    public let device: Device

    /**
     Module: ZaberMotionMicroscopy

     Gets number of filters of the changer.

     - Returns: Number of positions.
     */
    public func getNumberOfFilters() async throws -> Int {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = 1

        let response = try await Gateway.callAsync("device/get_index_count", request, DtoRequests.IntResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionMicroscopy

     Returns the current filter number starting from 1.
     The value of 0 indicates that the position is either unknown or between two filters.

     - Returns: Filter number starting from 1 or 0 if the position cannot be determined.
     */
    public func getCurrentFilter() async throws -> Int {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = 1

        let response = try await Gateway.callAsync("device/get_index_position", request, DtoRequests.IntResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionMicroscopy

     Changes to the specified filter.

     - Parameters:
        - filter: Filter number starting from 1.
     */
    public func change(filter: Int) async throws  {
        var request = DtoRequests.DeviceMoveRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = 1
        request.type = DtoRequests.AxisMoveType.index
        request.waitUntilIdle = true
        request.argInt = filter

        try await Gateway.callAsync("device/move", request)
    }

    /**
     Module: ZaberMotionMicroscopy

     Returns a string that represents the device.

     - Returns: A string that represents the device.
     */
    public func toString() throws -> String {
        var request = DtoRequests.AxisToStringRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress

        let response = try Gateway.callSync("device/device_to_string", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

}

