/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct UnitConvertUnitRequest: Serializable {
    public var value: Double
    public var fromUnit: Units
    public var toUnit: Units

    public init(value: Double = 0.0, fromUnit: Units = Units.native, toUnit: Units = Units.native) {
        self.value = value
        self.fromUnit = fromUnit
        self.toUnit = toUnit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> UnitConvertUnitRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(UnitConvertUnitRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "UnitConvertUnitRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "UnitConvertUnitRequest", error: error)
        }
    }
}
