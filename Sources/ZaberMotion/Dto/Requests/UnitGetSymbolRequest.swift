/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct UnitGetSymbolRequest: Serializable {
    public var unit: Units

    public init(unit: Units = Units.native) {
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> UnitGetSymbolRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(UnitGetSymbolRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "UnitGetSymbolRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "UnitGetSymbolRequest", error: error)
        }
    }
}
