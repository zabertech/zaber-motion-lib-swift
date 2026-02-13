/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal
import Dto


public struct DeviceMoveRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var waitUntilIdle: Bool
    public var type: AxisMoveType
    public var arg: Double
    public var argInt: Int
    public var unit: Units
    public var velocity: Double
    public var velocityUnit: Units
    public var acceleration: Double
    public var accelerationUnit: Units
    public var cyclicDirection: Dto.CyclicDirection?
    public var extraCycles: Int?

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, waitUntilIdle: Bool = false, type: AxisMoveType = AxisMoveType(rawValue: 0)!, arg: Double = 0.0, argInt: Int = 0, unit: Units = Units.native, velocity: Double = 0.0, velocityUnit: Units = Units.native, acceleration: Double = 0.0, accelerationUnit: Units = Units.native, cyclicDirection: Dto.CyclicDirection? = nil, extraCycles: Int? = nil) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.waitUntilIdle = waitUntilIdle
        self.type = type
        self.arg = arg
        self.argInt = argInt
        self.unit = unit
        self.velocity = velocity
        self.velocityUnit = velocityUnit
        self.acceleration = acceleration
        self.accelerationUnit = accelerationUnit
        self.cyclicDirection = cyclicDirection
        self.extraCycles = extraCycles
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceMoveRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceMoveRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceMoveRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceMoveRequest", error: error)
        }
    }
}
