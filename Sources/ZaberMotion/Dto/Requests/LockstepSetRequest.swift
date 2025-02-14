/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct LockstepSetRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var lockstepGroupId: Int
    public var value: Double
    public var unit: Units
    public var axisIndex: Int

    public init(interfaceId: Int = 0, device: Int = 0, lockstepGroupId: Int = 0, value: Double = 0.0, unit: Units = Units.native, axisIndex: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.lockstepGroupId = lockstepGroupId
        self.value = value
        self.unit = unit
        self.axisIndex = axisIndex
    }

    public static func fromByteArray(_ byteArray: Data) throws -> LockstepSetRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(LockstepSetRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "LockstepSetRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "LockstepSetRequest", error: error)
        }
    }
}
