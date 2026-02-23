/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct DeviceGetAllAnalogIORequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var channelType: String

    public init(interfaceId: Int = 0, device: Int = 0, channelType: String = "") {
        self.interfaceId = interfaceId
        self.device = device
        self.channelType = channelType
    }
}
