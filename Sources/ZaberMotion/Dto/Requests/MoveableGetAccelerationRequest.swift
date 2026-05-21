// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii
import UnitsInternal


public struct MoveableGetAccelerationRequest: Serializable {
    public var moveableId: Int
    public var accelType: DtoAscii.AccelType?
    public var unit: Units?

    public init(moveableId: Int = 0, accelType: DtoAscii.AccelType? = nil, unit: Units? = nil) {
        self.moveableId = moveableId
        self.accelType = accelType
        self.unit = unit
    }
}
