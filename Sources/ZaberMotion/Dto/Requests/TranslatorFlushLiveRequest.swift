/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct TranslatorFlushLiveRequest: Serializable {
    public var translatorId: Int
    public var waitUntilIdle: Bool

    public init(translatorId: Int = 0, waitUntilIdle: Bool = false) {
        self.translatorId = translatorId
        self.waitUntilIdle = waitUntilIdle
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TranslatorFlushLiveRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TranslatorFlushLiveRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TranslatorFlushLiveRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TranslatorFlushLiveRequest", error: error)
        }
    }
}
