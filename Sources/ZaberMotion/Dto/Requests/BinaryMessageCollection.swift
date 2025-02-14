/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoBinary


public struct BinaryMessageCollection: Serializable {
    public var messages: [DtoBinary.Message]

    public init(messages: [DtoBinary.Message] = []) {
        self.messages = messages
    }

    public static func fromByteArray(_ byteArray: Data) throws -> BinaryMessageCollection {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(BinaryMessageCollection.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "BinaryMessageCollection", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "BinaryMessageCollection", error: error)
        }
    }
}
