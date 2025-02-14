/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct TranslatorSetAxisPositionRequest: Serializable {
    public var translatorId: Int
    public var axis: String
    public var position: Double
    public var unit: Units

    public init(translatorId: Int = 0, axis: String = "", position: Double = 0.0, unit: Units = Units.native) {
        self.translatorId = translatorId
        self.axis = axis
        self.position = position
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TranslatorSetAxisPositionRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TranslatorSetAxisPositionRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TranslatorSetAxisPositionRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TranslatorSetAxisPositionRequest", error: error)
        }
    }
}
