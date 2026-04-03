// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Information about unit conversion.
 */
public struct UnitConversionDescriptor: Serializable {

    /**
     * Name of the dimension being converted.
     */
    public var dimension: String

    /**
     * Internal name of conversion function used.
     */
    public var conversionFunction: String

    /**
     * Scale factor used in conversion, if applicable.
     */
    public var scale: Double

    /**
     * Microstep resolution used in conversion, if applicable.
     */
    public var resolution: Int?

    public init(dimension: String = "", conversionFunction: String = "", scale: Double = 0.0, resolution: Int? = nil) {
        self.dimension = dimension
        self.conversionFunction = conversionFunction
        self.scale = scale
        self.resolution = resolution
    }
}
