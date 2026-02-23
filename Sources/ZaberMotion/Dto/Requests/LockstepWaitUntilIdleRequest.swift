/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct LockstepWaitUntilIdleRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var lockstepGroupId: Int
    public var throwErrorOnFault: Bool

    public init(interfaceId: Int = 0, device: Int = 0, lockstepGroupId: Int = 0, throwErrorOnFault: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.lockstepGroupId = lockstepGroupId
        self.throwErrorOnFault = throwErrorOnFault
    }
}
