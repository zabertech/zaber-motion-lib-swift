/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct UnitGetEnumResponse: Serializable {
    public var unit: Units

    public init(unit: Units = Units.native) {
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> UnitGetEnumResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(UnitGetEnumResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "UnitGetEnumResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "UnitGetEnumResponse", error: error)
        }
    }
}
