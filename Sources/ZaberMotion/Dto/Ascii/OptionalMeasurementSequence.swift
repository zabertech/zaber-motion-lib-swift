/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


/**
 * Represents a sequence of optional numerical values with optional units specified.
 */
public struct OptionalMeasurementSequence: Serializable {

    /**
     * Sequence of values.
     */
    public var values: [Double?]

    /**
     * Optional units of the sequence.
     */
    public var unit: Units?

    public init(values: [Double?] = [], unit: Units? = nil) {
        self.values = values
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> OptionalMeasurementSequence {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(OptionalMeasurementSequence.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "OptionalMeasurementSequence", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "OptionalMeasurementSequence", error: error)
        }
    }
}
