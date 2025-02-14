/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct BoolResponse: Serializable {
    public var value: Bool

    public init(value: Bool = false) {
        self.value = value
    }

    public static func fromByteArray(_ byteArray: Data) throws -> BoolResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(BoolResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "BoolResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "BoolResponse", error: error)
        }
    }
}
