/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
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

    public static func fromByteArray(_ byteArray: Data) throws -> MeasurementSequence {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(MeasurementSequence.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "MeasurementSequence", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "MeasurementSequence", error: error)
        }
    }
}
