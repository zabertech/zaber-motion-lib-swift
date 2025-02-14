/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct TranslatorGetAxisOffsetRequest: Serializable {
    public var translatorId: Int
    public var coordinateSystem: String
    public var axis: String
    public var unit: Units

    public init(translatorId: Int = 0, coordinateSystem: String = "", axis: String = "", unit: Units = Units.native) {
        self.translatorId = translatorId
        self.coordinateSystem = coordinateSystem
        self.axis = axis
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TranslatorGetAxisOffsetRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TranslatorGetAxisOffsetRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TranslatorGetAxisOffsetRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TranslatorGetAxisOffsetRequest", error: error)
        }
    }
}
