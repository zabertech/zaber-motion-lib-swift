// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct DeviceGetAnalogIORequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var channelType: String
    public var channelNumber: Int

    public init(interfaceId: Int = 0, device: Int = 0, channelType: String = "", channelNumber: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.channelType = channelType
        self.channelNumber = channelNumber
    }
}
