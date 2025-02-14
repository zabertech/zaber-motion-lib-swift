/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DeviceGetAnalogIORequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var channelType: String
    public var channelNumber: Int

    public init(interfaceId: Int = 0, device: Int = 0, channelType: String = "", channelNumber: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.channelType = channelType
        self.channelNumber = channelNumber
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceGetAnalogIORequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceGetAnalogIORequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceGetAnalogIORequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceGetAnalogIORequest", error: error)
        }
    }
}
