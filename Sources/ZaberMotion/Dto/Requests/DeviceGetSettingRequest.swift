// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import UnitsInternal


public struct DeviceGetSettingRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var setting: String
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, setting: String = "", unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.setting = setting
        self.unit = unit
    }
}
