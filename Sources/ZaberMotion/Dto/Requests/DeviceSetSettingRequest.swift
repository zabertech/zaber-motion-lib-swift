/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct DeviceSetSettingRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var setting: String
    public var value: Double
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, setting: String = "", value: Double = 0.0, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.setting = setting
        self.value = value
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceSetSettingRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceSetSettingRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceSetSettingRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceSetSettingRequest", error: error)
        }
    }
}
