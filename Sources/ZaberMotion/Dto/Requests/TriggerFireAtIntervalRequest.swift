// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import UnitsInternal


public struct TriggerFireAtIntervalRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var triggerNumber: Int
    public var interval: Double
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, triggerNumber: Int = 0, interval: Double = 0.0, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.triggerNumber = triggerNumber
        self.interval = interval
        self.unit = unit
    }
}
