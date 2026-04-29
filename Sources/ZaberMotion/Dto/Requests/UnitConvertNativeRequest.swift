// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import UnitsInternal
import Dto


public struct UnitConvertNativeRequest: Serializable {
    public var value: Double
    public var values: [Double]
    public var unit: Units
    public var conversion: Dto.UnitConversionDescriptor
    public var round: Bool

    public init(value: Double = 0.0, values: [Double] = [], unit: Units = Units.native, conversion: Dto.UnitConversionDescriptor = UnitConversionDescriptor(), round: Bool = false) {
        self.value = value
        self.values = values
        self.unit = unit
        self.conversion = conversion
        self.round = round
    }
}
