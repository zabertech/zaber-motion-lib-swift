/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct TranslatorSetTraverseRateRequest: Serializable {
    public var translatorId: Int
    public var traverseRate: Double
    public var unit: Units

    public init(translatorId: Int = 0, traverseRate: Double = 0.0, unit: Units = Units.native) {
        self.translatorId = translatorId
        self.traverseRate = traverseRate
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TranslatorSetTraverseRateRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TranslatorSetTraverseRateRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TranslatorSetTraverseRateRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TranslatorSetTraverseRateRequest", error: error)
        }
    }
}
