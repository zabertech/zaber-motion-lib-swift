// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import UnitsInternal


public struct UnitConvertUnitRequest: Serializable {
    public var value: Double
    public var fromUnit: Units
    public var toUnit: Units

    public init(value: Double = 0.0, fromUnit: Units = Units.native, toUnit: Units = Units.native) {
        self.value = value
        self.fromUnit = fromUnit
        self.toUnit = toUnit
    }
}
