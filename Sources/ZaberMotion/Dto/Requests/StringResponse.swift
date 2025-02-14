/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct StringResponse: Serializable {
    public var value: String

    public init(value: String = "") {
        self.value = value
    }

    public static func fromByteArray(_ byteArray: Data) throws -> StringResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(StringResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "StringResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "StringResponse", error: error)
        }
    }
}
