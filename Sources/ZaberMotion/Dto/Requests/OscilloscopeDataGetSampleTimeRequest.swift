/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct OscilloscopeDataGetSampleTimeRequest: Serializable {
    public var dataId: Int
    public var unit: Units
    public var index: Int

    public init(dataId: Int = 0, unit: Units = Units.native, index: Int = 0) {
        self.dataId = dataId
        self.unit = unit
        self.index = index
    }

    public static func fromByteArray(_ byteArray: Data) throws -> OscilloscopeDataGetSampleTimeRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(OscilloscopeDataGetSampleTimeRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "OscilloscopeDataGetSampleTimeRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "OscilloscopeDataGetSampleTimeRequest", error: error)
        }
    }
}
