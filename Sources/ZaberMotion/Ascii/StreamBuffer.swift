// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import DtoRequests
import Gateway
import ZaberMotionExceptions

/**
 Represents a stream buffer with this number on a device.
 A stream buffer is a place to store a queue of stream actions.
 */
public final class StreamBuffer {

    public init(device: Device, bufferId: Int) {
        self.device = device
        self.bufferId = bufferId
    }

    /**
     The Device this buffer exists on.
     */
    public let device: Device

    /**
     The number identifying the buffer on the device.
     */
    public let bufferId: Int

    /**
     Get the buffer contents as an array of strings.

     - Returns: A string array containing all the stream commands stored in the buffer.
     */
    public func getContent() async throws -> [String] {
        var request = DtoRequests.StreamBufferGetContentRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.bufferId = self.bufferId

        let response = try await Gateway.callAsync("device/stream_buffer_get_content", request, DtoRequests.StreamBufferGetContentResponse.fromByteArray)
        return response.bufferLines
    }

    /**
     Erase the contents of the buffer.
     This method fails if there is a stream writing to the buffer.
     */
    public func erase() async throws  {
        var request = DtoRequests.StreamBufferEraseRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.bufferId = self.bufferId

        try await Gateway.callAsync("device/stream_buffer_erase", request)
    }

}

