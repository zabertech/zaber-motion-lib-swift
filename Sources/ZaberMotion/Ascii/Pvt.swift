// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import DtoRequests
import Gateway
import ZaberMotionExceptions

/**
 Class providing access to device PVT (Position-Velocity-Time) features.
 Requires at least Firmware 7.33.
 */
public final class Pvt {

    public init(device: Device) {
        self.device = device
    }

    /**
     Device that this PVT belongs to.
     */
    public let device: Device

    /**
     Gets a PvtSequence class instance which allows you to control a particular PVT sequence on the device.

     - Parameters:
        - pvtId: The ID of the PVT sequence to control. The IDs start at 1.

     - Returns: PvtSequence instance.
     */
    public func getSequence(pvtId: Int) throws -> PvtSequence {
        guard pvtId > 0 else {
            throw ZaberMotionExceptions.InvalidArgumentException(message: "Invalid value; PVT sequences are numbered from 1.")
        }

        return PvtSequence(device: self.device, pvtId: pvtId)
    }

    /**
     Gets a PvtBuffer class instance which is a handle for a PVT buffer on the device.

     - Parameters:
        - pvtBufferId: The ID of the PVT buffer to control. PVT buffer IDs start at one.

     - Returns: PvtBuffer instance.
     */
    public func getBuffer(pvtBufferId: Int) throws -> PvtBuffer {
        guard pvtBufferId > 0 else {
            throw ZaberMotionExceptions.InvalidArgumentException(message: "Invalid value; PVT buffers are numbered from 1.")
        }

        return PvtBuffer(device: self.device, bufferId: pvtBufferId)
    }

    /**
     Get a list of buffer IDs that are currently in use.

     - Returns: List of buffer IDs.
     */
    public func listBufferIds() async throws -> [Int] {
        var request = DtoRequests.StreamBufferList()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.pvt = true

        let response = try await Gateway.callAsync("device/stream_buffer_list", request, DtoRequests.IntArrayResponse.fromByteArray)
        return response.values
    }

}

