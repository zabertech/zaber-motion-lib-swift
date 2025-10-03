/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct PvtBufferGetSequenceDataRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var bufferId: Int

    public init(interfaceId: Int = 0, device: Int = 0, bufferId: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.bufferId = bufferId
    }

    public static func fromByteArray(_ byteArray: Data) throws -> PvtBufferGetSequenceDataRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(PvtBufferGetSequenceDataRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "PvtBufferGetSequenceDataRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "PvtBufferGetSequenceDataRequest", error: error)
        }
    }
}
