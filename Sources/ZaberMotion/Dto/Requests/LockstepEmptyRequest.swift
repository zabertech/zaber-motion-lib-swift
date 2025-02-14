/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct LockstepEmptyRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var lockstepGroupId: Int

    public init(interfaceId: Int = 0, device: Int = 0, lockstepGroupId: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.lockstepGroupId = lockstepGroupId
    }

    public static func fromByteArray(_ byteArray: Data) throws -> LockstepEmptyRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(LockstepEmptyRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "LockstepEmptyRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "LockstepEmptyRequest", error: error)
        }
    }
}
