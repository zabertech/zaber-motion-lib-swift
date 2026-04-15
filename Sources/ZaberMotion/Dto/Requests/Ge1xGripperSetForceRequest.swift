// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct Ge1xGripperSetForceRequest: Serializable {
    public var connectionId: Int
    public var force: Int

    public init(connectionId: Int = 0, force: Int = 0) {
        self.connectionId = connectionId
        self.force = force
    }
}
