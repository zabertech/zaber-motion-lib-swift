/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct TriggerFireWhenDistanceTravelledRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var triggerNumber: Int
    public var axis: Int
    public var distance: Double
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, triggerNumber: Int = 0, axis: Int = 0, distance: Double = 0.0, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.triggerNumber = triggerNumber
        self.axis = axis
        self.distance = distance
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TriggerFireWhenDistanceTravelledRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TriggerFireWhenDistanceTravelledRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TriggerFireWhenDistanceTravelledRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TriggerFireWhenDistanceTravelledRequest", error: error)
        }
    }
}
