/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import UnitsInternal


/**
 * Represents a sequence of numerical values with optional units specified.
 */
public struct MeasurementSequence: Serializable {

    /**
     * Sequence of values.
     */
    public var values: [Double]

    /**
     * Optional units of the sequence.
     */
    public var unit: Units?

    public init(values: [Double] = [], unit: Units? = nil) {
        self.values = values
        self.unit = unit
    }
}
