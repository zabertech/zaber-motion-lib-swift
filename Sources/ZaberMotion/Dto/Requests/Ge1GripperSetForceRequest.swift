/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct Ge1GripperSetForceRequest: Serializable {
    public var connectionId: Int
    public var force: Int

    public init(connectionId: Int = 0, force: Int = 0) {
        self.connectionId = connectionId
        self.force = force
    }
}
