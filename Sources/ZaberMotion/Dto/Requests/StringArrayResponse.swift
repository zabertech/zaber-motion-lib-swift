/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct StringArrayResponse: Serializable {
    public var values: [String]

    public init(values: [String] = []) {
        self.values = values
    }

    public static func fromByteArray(_ byteArray: Data) throws -> StringArrayResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(StringArrayResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "StringArrayResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "StringArrayResponse", error: error)
        }
    }
}
