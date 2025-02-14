/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct SetInternalModeRequest: Serializable {
    public var mode: Bool

    public init(mode: Bool = false) {
        self.mode = mode
    }

    public static func fromByteArray(_ byteArray: Data) throws -> SetInternalModeRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(SetInternalModeRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "SetInternalModeRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "SetInternalModeRequest", error: error)
        }
    }
}
