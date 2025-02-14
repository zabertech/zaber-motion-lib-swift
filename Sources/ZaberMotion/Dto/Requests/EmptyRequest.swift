/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct EmptyRequest: Serializable {

    public init() {
    }

    public static func fromByteArray(_ byteArray: Data) throws -> EmptyRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(EmptyRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "EmptyRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "EmptyRequest", error: error)
        }
    }
}
