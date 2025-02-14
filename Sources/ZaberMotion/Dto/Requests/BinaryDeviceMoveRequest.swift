/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct BinaryDeviceMoveRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var timeout: Double
    public var type: AxisMoveType
    public var arg: Double
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, timeout: Double = 0.0, type: AxisMoveType = AxisMoveType(rawValue: 0)!, arg: Double = 0.0, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.timeout = timeout
        self.type = type
        self.arg = arg
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> BinaryDeviceMoveRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(BinaryDeviceMoveRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "BinaryDeviceMoveRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "BinaryDeviceMoveRequest", error: error)
        }
    }
}
