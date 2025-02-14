/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct UnitGetEnumRequest: Serializable {
    public var symbol: String

    public init(symbol: String = "") {
        self.symbol = symbol
    }

    public static func fromByteArray(_ byteArray: Data) throws -> UnitGetEnumRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(UnitGetEnumRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "UnitGetEnumRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "UnitGetEnumRequest", error: error)
        }
    }
}
