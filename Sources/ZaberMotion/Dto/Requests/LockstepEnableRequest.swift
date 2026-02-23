/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct LockstepEnableRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var lockstepGroupId: Int
    public var axes: [Int]

    public init(interfaceId: Int = 0, device: Int = 0, lockstepGroupId: Int = 0, axes: [Int] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.lockstepGroupId = lockstepGroupId
        self.axes = axes
    }
}
