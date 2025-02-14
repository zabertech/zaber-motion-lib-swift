/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct ProcessOn: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var on: Bool
    public var duration: Double
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, on: Bool = false, duration: Double = 0.0, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.on = on
        self.duration = duration
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> ProcessOn {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(ProcessOn.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "ProcessOn", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "ProcessOn", error: error)
        }
    }
}
