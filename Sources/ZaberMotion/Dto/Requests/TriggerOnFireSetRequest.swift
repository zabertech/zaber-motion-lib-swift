/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoAscii
import UnitsInternal


public struct TriggerOnFireSetRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var triggerNumber: Int
    public var action: DtoAscii.TriggerAction
    public var axis: Int
    public var setting: String
    public var operation: DtoAscii.TriggerOperation
    public var value: Double
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, triggerNumber: Int = 0, action: DtoAscii.TriggerAction = TriggerAction(rawValue: 0)!, axis: Int = 0, setting: String = "", operation: DtoAscii.TriggerOperation = TriggerOperation(rawValue: 0)!, value: Double = 0.0, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.triggerNumber = triggerNumber
        self.action = action
        self.axis = axis
        self.setting = setting
        self.operation = operation
        self.value = value
        self.unit = unit
    }
}
