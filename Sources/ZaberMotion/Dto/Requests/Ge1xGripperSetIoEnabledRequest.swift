// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct Ge1xGripperSetIoEnabledRequest: Serializable {
    public var connectionId: Int
    public var enabled: Bool
    public var saveToFlash: Bool

    public init(connectionId: Int = 0, enabled: Bool = false, saveToFlash: Bool = false) {
        self.connectionId = connectionId
        self.enabled = enabled
        self.saveToFlash = saveToFlash
    }
}
