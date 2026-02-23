/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct TriggerFireWhenRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var triggerNumber: Int
    public var condition: String

    public init(interfaceId: Int = 0, device: Int = 0, triggerNumber: Int = 0, condition: String = "") {
        self.interfaceId = interfaceId
        self.device = device
        self.triggerNumber = triggerNumber
        self.condition = condition
    }
}
