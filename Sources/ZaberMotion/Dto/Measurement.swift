// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import UnitsInternal


/**
 * Represents a numerical value with optional units specified.
 */
public struct Measurement: Serializable {

    /**
     * Value of the measurement.
     */
    public var value: Double

    /**
     * Optional units of the measurement.
     */
    public var unit: Units?

    public init(value: Double = 0.0, unit: Units? = nil) {
        self.value = value
        self.unit = unit
    }
}
