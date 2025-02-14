/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct LockstepWaitUntilIdleRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var lockstepGroupId: Int
    public var throwErrorOnFault: Bool

    public init(interfaceId: Int = 0, device: Int = 0, lockstepGroupId: Int = 0, throwErrorOnFault: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.lockstepGroupId = lockstepGroupId
        self.throwErrorOnFault = throwErrorOnFault
    }

    public static func fromByteArray(_ byteArray: Data) throws -> LockstepWaitUntilIdleRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(LockstepWaitUntilIdleRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "LockstepWaitUntilIdleRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "LockstepWaitUntilIdleRequest", error: error)
        }
    }
}
