/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct StreamCancelOutputScheduleRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var pvt: Bool
    public var analog: Bool
    public var channelNumber: Int

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, pvt: Bool = false, analog: Bool = false, channelNumber: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.pvt = pvt
        self.analog = analog
        self.channelNumber = channelNumber
    }
}
