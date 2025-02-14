/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct LockstepEnableRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var lockstepGroupId: Int
    public var axes: [Int]

    public init(interfaceId: Int = 0, device: Int = 0, lockstepGroupId: Int = 0, axes: [Int] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.lockstepGroupId = lockstepGroupId
        self.axes = axes
    }

    public static func fromByteArray(_ byteArray: Data) throws -> LockstepEnableRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(LockstepEnableRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "LockstepEnableRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "LockstepEnableRequest", error: error)
        }
    }
}
