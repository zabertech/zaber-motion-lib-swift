/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct TranslatorCreateResponse: Serializable {
    public var translatorId: Int

    public init(translatorId: Int = 0) {
        self.translatorId = translatorId
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TranslatorCreateResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TranslatorCreateResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TranslatorCreateResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TranslatorCreateResponse", error: error)
        }
    }
}
