/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DeviceSetAllAnalogOutputsRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var values: [Double]

    public init(interfaceId: Int = 0, device: Int = 0, values: [Double] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.values = values
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceSetAllAnalogOutputsRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceSetAllAnalogOutputsRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceSetAllAnalogOutputsRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceSetAllAnalogOutputsRequest", error: error)
        }
    }
}
