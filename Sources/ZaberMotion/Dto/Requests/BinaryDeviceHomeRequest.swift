/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct BinaryDeviceHomeRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var timeout: Double
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, timeout: Double = 0.0, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.timeout = timeout
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> BinaryDeviceHomeRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(BinaryDeviceHomeRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "BinaryDeviceHomeRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "BinaryDeviceHomeRequest", error: error)
        }
    }
}
