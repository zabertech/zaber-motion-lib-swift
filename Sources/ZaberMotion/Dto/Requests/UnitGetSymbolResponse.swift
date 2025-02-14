/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct UnitGetSymbolResponse: Serializable {
    public var symbol: String

    public init(symbol: String = "") {
        self.symbol = symbol
    }

    public static func fromByteArray(_ byteArray: Data) throws -> UnitGetSymbolResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(UnitGetSymbolResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "UnitGetSymbolResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "UnitGetSymbolResponse", error: error)
        }
    }
}
