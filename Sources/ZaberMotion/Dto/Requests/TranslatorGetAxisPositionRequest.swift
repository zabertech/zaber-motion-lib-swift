/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct TranslatorGetAxisPositionRequest: Serializable {
    public var translatorId: Int
    public var axis: String
    public var unit: Units

    public init(translatorId: Int = 0, axis: String = "", unit: Units = Units.native) {
        self.translatorId = translatorId
        self.axis = axis
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TranslatorGetAxisPositionRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TranslatorGetAxisPositionRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TranslatorGetAxisPositionRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TranslatorGetAxisPositionRequest", error: error)
        }
    }
}
