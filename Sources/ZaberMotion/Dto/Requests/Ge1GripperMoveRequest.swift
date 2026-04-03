// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct Ge1GripperMoveRequest: Serializable {
    public var connectionId: Int
    public var position: Double
    public var waitUntilIdle: Bool

    public init(connectionId: Int = 0, position: Double = 0.0, waitUntilIdle: Bool = false) {
        self.connectionId = connectionId
        self.position = position
        self.waitUntilIdle = waitUntilIdle
    }
}
