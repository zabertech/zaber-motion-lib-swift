// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct Ge1xGripperCalibrateRequest: Serializable {
    public var connectionId: Int
    public var saveToFlash: Bool

    public init(connectionId: Int = 0, saveToFlash: Bool = false) {
        self.connectionId = connectionId
        self.saveToFlash = saveToFlash
    }
}
