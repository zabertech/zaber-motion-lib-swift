/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoBinary
import UnitsInternal


public struct BinaryDeviceGetSettingRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var setting: DtoBinary.BinarySettings
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, setting: DtoBinary.BinarySettings = BinarySettings(rawValue: 0)!, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.setting = setting
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> BinaryDeviceGetSettingRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(BinaryDeviceGetSettingRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "BinaryDeviceGetSettingRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "BinaryDeviceGetSettingRequest", error: error)
        }
    }
}
