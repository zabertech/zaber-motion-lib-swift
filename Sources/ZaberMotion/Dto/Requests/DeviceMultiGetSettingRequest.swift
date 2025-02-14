/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct DeviceMultiGetSettingRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var settings: [DtoAscii.GetSetting]
    public var axisSettings: [DtoAscii.GetAxisSetting]

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, settings: [DtoAscii.GetSetting] = [], axisSettings: [DtoAscii.GetAxisSetting] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.settings = settings
        self.axisSettings = axisSettings
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceMultiGetSettingRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceMultiGetSettingRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceMultiGetSettingRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceMultiGetSettingRequest", error: error)
        }
    }
}
