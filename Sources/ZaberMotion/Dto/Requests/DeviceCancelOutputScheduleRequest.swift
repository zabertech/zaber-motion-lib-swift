// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct DeviceCancelOutputScheduleRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var analog: Bool
    public var channelNumber: Int

    public init(interfaceId: Int = 0, device: Int = 0, analog: Bool = false, channelNumber: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.analog = analog
        self.channelNumber = channelNumber
    }
}
