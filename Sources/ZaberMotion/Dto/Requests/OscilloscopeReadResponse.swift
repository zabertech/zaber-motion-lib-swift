/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct OscilloscopeReadResponse: Serializable {
    public var dataIds: [Int]

    public init(dataIds: [Int] = []) {
        self.dataIds = dataIds
    }

    public static func fromByteArray(_ byteArray: Data) throws -> OscilloscopeReadResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(OscilloscopeReadResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "OscilloscopeReadResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "OscilloscopeReadResponse", error: error)
        }
    }
}
