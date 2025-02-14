/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct IntResponse: Serializable {
    public var value: Int

    public init(value: Int = 0) {
        self.value = value
    }

    public static func fromByteArray(_ byteArray: Data) throws -> IntResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(IntResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "IntResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "IntResponse", error: error)
        }
    }
}
