// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import DtoRequests
import Gateway
import ZaberMotionExceptions

/**
 Class providing access to device streams.
 Requires at least Firmware 7.05.
 */
public final class Streams {

    public init(device: Device) {
        self.device = device
    }

    /**
     Device that these streams belong to.
     */
    public let device: Device

    /**
     Gets a Stream class instance which allows you to control a particular stream on the device.

     - Parameters:
        - streamId: The ID of the stream to control. Stream IDs start at one.

     - Returns: Stream instance.
     */
    public func getStream(streamId: Int) throws -> Stream {
        guard streamId > 0 else {
            throw ZaberMotionExceptions.InvalidArgumentException(message: "Invalid value; streams are numbered from 1.")
        }

        return Stream(device: self.device, streamId: streamId)
    }

    /**
     Gets a StreamBuffer class instance which is a handle for a stream buffer on the device.

     - Parameters:
        - streamBufferId: The ID of the stream buffer to control. Stream buffer IDs start at one.

     - Returns: StreamBuffer instance.
     */
    public func getBuffer(streamBufferId: Int) throws -> StreamBuffer {
        guard streamBufferId > 0 else {
            throw ZaberMotionExceptions.InvalidArgumentException(message: "Invalid value; stream buffers are numbered from 1.")
        }

        return StreamBuffer(device: self.device, bufferId: streamBufferId)
    }

    /**
     Get a list of buffer IDs that are currently in use.

     - Returns: List of buffer IDs.
     */
    public func listBufferIds() async throws -> [Int] {
        var request = DtoRequests.StreamBufferList()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.pvt = false

        let response = try await Gateway.callAsync("device/stream_buffer_list", request, DtoRequests.IntArrayResponse.fromByteArray)
        return response.values
    }

}
