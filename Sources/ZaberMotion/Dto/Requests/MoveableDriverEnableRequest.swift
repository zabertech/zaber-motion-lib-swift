// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct MoveableDriverEnableRequest: Serializable {
    public var moveableId: Int
    public var timeout: Double

    public init(moveableId: Int = 0, timeout: Double = 0.0) {
        self.moveableId = moveableId
        self.timeout = timeout
    }
}
