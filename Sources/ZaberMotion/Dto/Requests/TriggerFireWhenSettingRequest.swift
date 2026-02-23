/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoAscii
import UnitsInternal


public struct TriggerFireWhenSettingRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var triggerNumber: Int
    public var axis: Int
    public var setting: String
    public var triggerCondition: DtoAscii.TriggerCondition
    public var value: Double
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, triggerNumber: Int = 0, axis: Int = 0, setting: String = "", triggerCondition: DtoAscii.TriggerCondition = TriggerCondition(rawValue: 0)!, value: Double = 0.0, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.triggerNumber = triggerNumber
        self.axis = axis
        self.setting = setting
        self.triggerCondition = triggerCondition
        self.value = value
        self.unit = unit
    }
}
