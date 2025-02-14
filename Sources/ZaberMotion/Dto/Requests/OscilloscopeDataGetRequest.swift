/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct OscilloscopeDataGetRequest: Serializable {
    public var dataId: Int
    public var unit: Units

    public init(dataId: Int = 0, unit: Units = Units.native) {
        self.dataId = dataId
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> OscilloscopeDataGetRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(OscilloscopeDataGetRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "OscilloscopeDataGetRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "OscilloscopeDataGetRequest", error: error)
        }
    }
}
