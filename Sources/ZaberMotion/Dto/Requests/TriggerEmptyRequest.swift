/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct TriggerEmptyRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var triggerNumber: Int

    public init(interfaceId: Int = 0, device: Int = 0, triggerNumber: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.triggerNumber = triggerNumber
    }
}
