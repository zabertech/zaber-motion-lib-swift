/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct TranslatorFlushResponse: Serializable {
    public var commands: [String]

    public init(commands: [String] = []) {
        self.commands = commands
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TranslatorFlushResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TranslatorFlushResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TranslatorFlushResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TranslatorFlushResponse", error: error)
        }
    }
}
