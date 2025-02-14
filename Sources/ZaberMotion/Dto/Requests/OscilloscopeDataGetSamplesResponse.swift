/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct OscilloscopeDataGetSamplesResponse: Serializable {
    public var data: [Double]

    public init(data: [Double] = []) {
        self.data = data
    }

    public static func fromByteArray(_ byteArray: Data) throws -> OscilloscopeDataGetSamplesResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(OscilloscopeDataGetSamplesResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "OscilloscopeDataGetSamplesResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "OscilloscopeDataGetSamplesResponse", error: error)
        }
    }
}
