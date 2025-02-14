/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct TranslatorSetFeedRateOverrideRequest: Serializable {
    public var translatorId: Int
    public var coefficient: Double

    public init(translatorId: Int = 0, coefficient: Double = 0.0) {
        self.translatorId = translatorId
        self.coefficient = coefficient
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TranslatorSetFeedRateOverrideRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TranslatorSetFeedRateOverrideRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TranslatorSetFeedRateOverrideRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TranslatorSetFeedRateOverrideRequest", error: error)
        }
    }
}
