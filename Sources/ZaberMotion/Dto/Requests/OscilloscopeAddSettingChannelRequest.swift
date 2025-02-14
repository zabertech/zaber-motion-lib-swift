/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct OscilloscopeAddSettingChannelRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var setting: String

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, setting: String = "") {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.setting = setting
    }

    public static func fromByteArray(_ byteArray: Data) throws -> OscilloscopeAddSettingChannelRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(OscilloscopeAddSettingChannelRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "OscilloscopeAddSettingChannelRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "OscilloscopeAddSettingChannelRequest", error: error)
        }
    }
}
