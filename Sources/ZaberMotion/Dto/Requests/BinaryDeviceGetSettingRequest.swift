// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoBinary
import UnitsInternal


public struct BinaryDeviceGetSettingRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var setting: DtoBinary.BinarySettings
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, setting: DtoBinary.BinarySettings = BinarySettings(rawValue: 0)!, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.setting = setting
        self.unit = unit
    }
}
