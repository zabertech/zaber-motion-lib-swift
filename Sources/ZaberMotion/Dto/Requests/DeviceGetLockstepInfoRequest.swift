// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import UnitsInternal


public struct DeviceGetLockstepInfoRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.unit = unit
    }
}
