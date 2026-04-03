// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct DeviceCancelAllOutputsScheduleRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var analog: Bool
    public var channels: [Bool]

    public init(interfaceId: Int = 0, device: Int = 0, analog: Bool = false, channels: [Bool] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.analog = analog
        self.channels = channels
    }
}
