// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct LockstepStopRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var lockstepGroupId: Int
    public var waitUntilIdle: Bool

    public init(interfaceId: Int = 0, device: Int = 0, lockstepGroupId: Int = 0, waitUntilIdle: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.lockstepGroupId = lockstepGroupId
        self.waitUntilIdle = waitUntilIdle
    }
}
