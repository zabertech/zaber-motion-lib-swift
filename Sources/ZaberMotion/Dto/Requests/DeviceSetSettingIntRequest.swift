/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct DeviceSetSettingIntRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var setting: String
    public var value: Int64

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, setting: String = "", value: Int64 = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.setting = setting
        self.value = value
    }
}
