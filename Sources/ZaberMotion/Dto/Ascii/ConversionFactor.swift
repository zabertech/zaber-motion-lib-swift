/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import UnitsInternal


/**
 * Represents unit conversion factor for a single dimension.
 */
public struct ConversionFactor: Serializable {

    /**
     * Setting representing the dimension.
     */
    public var setting: String

    /**
     * Value representing 1 native device unit in specified real-word units.
     */
    public var value: Double

    /**
     * Units of the value.
     */
    public var unit: Units

    public init(setting: String = "", value: Double = 0.0, unit: Units = Units.native) {
        self.setting = setting
        self.value = value
        self.unit = unit
    }
}
