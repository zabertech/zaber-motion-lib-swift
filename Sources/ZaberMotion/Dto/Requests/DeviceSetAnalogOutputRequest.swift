// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct DeviceSetAnalogOutputRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var channelNumber: Int
    public var value: Double

    public init(interfaceId: Int = 0, device: Int = 0, channelNumber: Int = 0, value: Double = 0.0) {
        self.interfaceId = interfaceId
        self.device = device
        self.channelNumber = channelNumber
        self.value = value
    }
}
