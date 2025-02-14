/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct TranslatorTranslateRequest: Serializable {
    public var translatorId: Int
    public var block: String

    public init(translatorId: Int = 0, block: String = "") {
        self.translatorId = translatorId
        self.block = block
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TranslatorTranslateRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TranslatorTranslateRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TranslatorTranslateRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TranslatorTranslateRequest", error: error)
        }
    }
}
