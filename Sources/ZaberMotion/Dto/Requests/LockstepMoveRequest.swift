/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct LockstepMoveRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var lockstepGroupId: Int
    public var waitUntilIdle: Bool
    public var type: AxisMoveType
    public var arg: Double
    public var unit: Units
    public var velocity: Double
    public var velocityUnit: Units
    public var acceleration: Double
    public var accelerationUnit: Units

    public init(interfaceId: Int = 0, device: Int = 0, lockstepGroupId: Int = 0, waitUntilIdle: Bool = false, type: AxisMoveType = AxisMoveType(rawValue: 0)!, arg: Double = 0.0, unit: Units = Units.native, velocity: Double = 0.0, velocityUnit: Units = Units.native, acceleration: Double = 0.0, accelerationUnit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.lockstepGroupId = lockstepGroupId
        self.waitUntilIdle = waitUntilIdle
        self.type = type
        self.arg = arg
        self.unit = unit
        self.velocity = velocity
        self.velocityUnit = velocityUnit
        self.acceleration = acceleration
        self.accelerationUnit = accelerationUnit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> LockstepMoveRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(LockstepMoveRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "LockstepMoveRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "LockstepMoveRequest", error: error)
        }
    }
}
