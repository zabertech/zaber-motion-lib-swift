/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct StreamSetAnalogOutputRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var pvt: Bool
    public var channelNumber: Int
    public var value: Double

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, pvt: Bool = false, channelNumber: Int = 0, value: Double = 0.0) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.pvt = pvt
        self.channelNumber = channelNumber
        self.value = value
    }
}
