/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct Ge1GripperWaitUntilIdleRequest: Serializable {
    public var connectionId: Int
    public var waitUntilIdle: Bool

    public init(connectionId: Int = 0, waitUntilIdle: Bool = false) {
        self.connectionId = connectionId
        self.waitUntilIdle = waitUntilIdle
    }
}
