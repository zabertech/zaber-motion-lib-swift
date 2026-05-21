// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct MoveableWaitUntilIdleRequest: Serializable {
    public var moveableId: Int
    public var throwErrorOnFault: Bool

    public init(moveableId: Int = 0, throwErrorOnFault: Bool = false) {
        self.moveableId = moveableId
        self.throwErrorOnFault = throwErrorOnFault
    }
}
