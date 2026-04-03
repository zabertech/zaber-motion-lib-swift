// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct Ge1GripperSetIoInputFilterRequest: Serializable {
    public var connectionId: Int
    public var duration: Int
    public var saveToFlash: Bool

    public init(connectionId: Int = 0, duration: Int = 0, saveToFlash: Bool = false) {
        self.connectionId = connectionId
        self.duration = duration
        self.saveToFlash = saveToFlash
    }
}
