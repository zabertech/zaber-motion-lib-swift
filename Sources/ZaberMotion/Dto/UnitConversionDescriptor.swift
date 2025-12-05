/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
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

    public static func fromByteArray(_ byteArray: Data) throws -> UnitConversionDescriptor {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(UnitConversionDescriptor.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "UnitConversionDescriptor", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "UnitConversionDescriptor", error: error)
        }
    }
}
