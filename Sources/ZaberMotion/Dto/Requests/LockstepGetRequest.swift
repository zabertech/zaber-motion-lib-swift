/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct LockstepGetRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var lockstepGroupId: Int
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, lockstepGroupId: Int = 0, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.lockstepGroupId = lockstepGroupId
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> LockstepGetRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(LockstepGetRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "LockstepGetRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "LockstepGetRequest", error: error)
        }
    }
}
