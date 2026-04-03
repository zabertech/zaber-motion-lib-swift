// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct TriggerSetLabelRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var triggerNumber: Int
    public var label: String?

    public init(interfaceId: Int = 0, device: Int = 0, triggerNumber: Int = 0, label: String? = nil) {
        self.interfaceId = interfaceId
        self.device = device
        self.triggerNumber = triggerNumber
        self.label = label
    }
}
