// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct TriggerOnFireSetToSettingRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var triggerNumber: Int
    public var action: DtoAscii.TriggerAction
    public var axis: Int
    public var setting: String
    public var operation: DtoAscii.TriggerOperation
    public var fromAxis: Int
    public var fromSetting: String

    public init(interfaceId: Int = 0, device: Int = 0, triggerNumber: Int = 0, action: DtoAscii.TriggerAction = TriggerAction(rawValue: 0)!, axis: Int = 0, setting: String = "", operation: DtoAscii.TriggerOperation = TriggerOperation(rawValue: 0)!, fromAxis: Int = 0, fromSetting: String = "") {
        self.interfaceId = interfaceId
        self.device = device
        self.triggerNumber = triggerNumber
        self.action = action
        self.axis = axis
        self.setting = setting
        self.operation = operation
        self.fromAxis = fromAxis
        self.fromSetting = fromSetting
    }
}
