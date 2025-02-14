/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
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

    public static func fromByteArray(_ byteArray: Data) throws -> ConversionFactor {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(ConversionFactor.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "ConversionFactor", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "ConversionFactor", error: error)
        }
    }
}
