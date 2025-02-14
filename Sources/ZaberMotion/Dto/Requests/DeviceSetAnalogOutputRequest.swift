/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DeviceSetAnalogOutputRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var channelNumber: Int
    public var value: Double

    public init(interfaceId: Int = 0, device: Int = 0, channelNumber: Int = 0, value: Double = 0.0) {
        self.interfaceId = interfaceId
        self.device = device
        self.channelNumber = channelNumber
        self.value = value
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceSetAnalogOutputRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceSetAnalogOutputRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceSetAnalogOutputRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceSetAnalogOutputRequest", error: error)
        }
    }
}
