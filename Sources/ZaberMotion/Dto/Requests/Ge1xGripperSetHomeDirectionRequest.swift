// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoProduct


public struct Ge1xGripperSetHomeDirectionRequest: Serializable {
    public var connectionId: Int
    public var direction: DtoProduct.Ge1xGripperDirection
    public var saveToFlash: Bool

    public init(connectionId: Int = 0, direction: DtoProduct.Ge1xGripperDirection = Ge1xGripperDirection(rawValue: 0)!, saveToFlash: Bool = false) {
        self.connectionId = connectionId
        self.direction = direction
        self.saveToFlash = saveToFlash
    }
}
