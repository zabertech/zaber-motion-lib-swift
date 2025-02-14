/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct DeviceConvertSettingRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var setting: String
    public var unit: Units
    public var value: Double
    public var fromNative: Bool

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, setting: String = "", unit: Units = Units.native, value: Double = 0.0, fromNative: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.setting = setting
        self.unit = unit
        self.value = value
        self.fromNative = fromNative
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceConvertSettingRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceConvertSettingRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceConvertSettingRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceConvertSettingRequest", error: error)
        }
    }
}
