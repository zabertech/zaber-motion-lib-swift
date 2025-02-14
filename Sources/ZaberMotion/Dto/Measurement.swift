/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
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

    public static func fromByteArray(_ byteArray: Data) throws -> Measurement {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(Measurement.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "Measurement", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "Measurement", error: error)
        }
    }
}
