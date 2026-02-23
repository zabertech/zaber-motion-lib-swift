/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import UnitsInternal


public struct LockstepGetRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var lockstepGroupId: Int
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, lockstepGroupId: Int = 0, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.lockstepGroupId = lockstepGroupId
        self.unit = unit
    }
}
