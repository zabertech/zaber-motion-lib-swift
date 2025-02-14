/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct OscilloscopeDataIdentifier: Serializable {
    public var dataId: Int

    public init(dataId: Int = 0) {
        self.dataId = dataId
    }

    public static func fromByteArray(_ byteArray: Data) throws -> OscilloscopeDataIdentifier {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(OscilloscopeDataIdentifier.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "OscilloscopeDataIdentifier", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "OscilloscopeDataIdentifier", error: error)
        }
    }
}
