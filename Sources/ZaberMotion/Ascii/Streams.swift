// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import DtoRequests
import Gateway
import ZaberMotionExceptions

/**
 Module: ZaberMotionAscii

 Class providing access to device streams.
 Requires at least Firmware 7.05.
 */
public final class Streams: @unchecked Sendable {

    package init(device: Device) {
        self.device = device
    }

    /**
     Module: ZaberMotionAscii

     Device that these streams belong to.
     */
    public let device: Device

    /**
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

     Gets a StreamBuffer class instance which is a handle for a stream buffer on the device.

     - Parameters:
        - streamBufferNumber: The ID number of the stream buffer to control. Stream buffer IDs start at one.

     - Returns: StreamBuffer instance.
     */
    public func getBuffer(streamBufferNumber: Int) throws -> StreamBuffer {
        guard streamBufferNumber > 0 else {
            throw ZaberMotionExceptions.InvalidArgumentException(message: "Invalid value; stream buffers are numbered from 1.")
        }

        return StreamBuffer(device: self.device, bufferNumber: streamBufferNumber)
    }

    /**
     Module: ZaberMotionAscii

     Get a list of buffer ID numbers that are currently in use.

     - Returns: List of buffer IDs.
     */
    public func listBufferNumbers() async throws -> [Int] {
        var request = DtoRequests.StreamBufferList()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.pvt = false

        let response = try await Gateway.callAsync("device/stream_buffer_list", request, DtoRequests.IntArrayResponse.fromByteArray)
        return response.values
    }
}
