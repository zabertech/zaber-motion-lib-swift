// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import UnitsInternal


public struct UnitGetEnumResponse: Serializable {
    public var unit: Units

    public init(unit: Units = Units.native) {
        self.unit = unit
    }
}
