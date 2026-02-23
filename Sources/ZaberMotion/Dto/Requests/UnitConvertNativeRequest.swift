/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import UnitsInternal
import Dto


public struct UnitConvertNativeRequest: Serializable {
    public var value: Double
    public var values: [Double]
    public var unit: Units
    public var conversion: Dto.UnitConversionDescriptor

    public init(value: Double = 0.0, values: [Double] = [], unit: Units = Units.native, conversion: Dto.UnitConversionDescriptor = UnitConversionDescriptor()) {
        self.value = value
        self.values = values
        self.unit = unit
        self.conversion = conversion
    }
}
