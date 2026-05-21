// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import UnitsInternal


public struct MoveableGetSettingRequest: Serializable {
    public var moveableId: Int
    public var unit: Units?

    public init(moveableId: Int = 0, unit: Units? = nil) {
        self.moveableId = moveableId
        self.unit = unit
    }
}
