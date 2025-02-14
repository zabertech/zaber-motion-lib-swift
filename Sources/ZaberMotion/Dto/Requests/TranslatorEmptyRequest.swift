/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct TranslatorEmptyRequest: Serializable {
    public var translatorId: Int

    public init(translatorId: Int = 0) {
        self.translatorId = translatorId
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TranslatorEmptyRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TranslatorEmptyRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TranslatorEmptyRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TranslatorEmptyRequest", error: error)
        }
    }
}
