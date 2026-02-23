/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct DeviceSetSettingBoolRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var setting: String
    public var value: Bool

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, setting: String = "", value: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.setting = setting
        self.value = value
    }
}
