/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct LockstepStopRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var lockstepGroupId: Int
    public var waitUntilIdle: Bool

    public init(interfaceId: Int = 0, device: Int = 0, lockstepGroupId: Int = 0, waitUntilIdle: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.lockstepGroupId = lockstepGroupId
        self.waitUntilIdle = waitUntilIdle
    }

    public static func fromByteArray(_ byteArray: Data) throws -> LockstepStopRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(LockstepStopRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "LockstepStopRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "LockstepStopRequest", error: error)
        }
    }
}
