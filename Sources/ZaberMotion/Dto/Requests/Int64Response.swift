/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct Int64Response: Serializable {
    public var value: Int64

    public init(value: Int64 = 0) {
        self.value = value
    }

    public static func fromByteArray(_ byteArray: Data) throws -> Int64Response {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(Int64Response.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "Int64Response", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "Int64Response", error: error)
        }
    }
}
