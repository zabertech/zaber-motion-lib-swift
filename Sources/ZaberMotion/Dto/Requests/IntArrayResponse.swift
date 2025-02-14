/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct IntArrayResponse: Serializable {
    public var values: [Int]

    public init(values: [Int] = []) {
        self.values = values
    }

    public static func fromByteArray(_ byteArray: Data) throws -> IntArrayResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(IntArrayResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "IntArrayResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "IntArrayResponse", error: error)
        }
    }
}
