/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DeviceGetAllAnalogIORequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var channelType: String

    public init(interfaceId: Int = 0, device: Int = 0, channelType: String = "") {
        self.interfaceId = interfaceId
        self.device = device
        self.channelType = channelType
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceGetAllAnalogIORequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceGetAllAnalogIORequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceGetAllAnalogIORequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceGetAllAnalogIORequest", error: error)
        }
    }
}
