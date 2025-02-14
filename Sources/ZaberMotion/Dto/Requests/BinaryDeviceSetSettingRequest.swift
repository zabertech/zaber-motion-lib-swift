/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoBinary
import UnitsInternal


public struct BinaryDeviceSetSettingRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var setting: DtoBinary.BinarySettings
    public var value: Double
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, setting: DtoBinary.BinarySettings = BinarySettings(rawValue: 0)!, value: Double = 0.0, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.setting = setting
        self.value = value
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> BinaryDeviceSetSettingRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(BinaryDeviceSetSettingRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "BinaryDeviceSetSettingRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "BinaryDeviceSetSettingRequest", error: error)
        }
    }
}
