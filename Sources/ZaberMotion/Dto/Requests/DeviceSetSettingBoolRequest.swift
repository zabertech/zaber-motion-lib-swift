/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DeviceSetSettingBoolRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var setting: String
    public var value: Bool

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, setting: String = "", value: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.setting = setting
        self.value = value
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceSetSettingBoolRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceSetSettingBoolRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceSetSettingBoolRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceSetSettingBoolRequest", error: error)
        }
    }
}
