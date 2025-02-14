/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct DeviceSetAllDigitalOutputsRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var values: [DtoAscii.DigitalOutputAction]

    public init(interfaceId: Int = 0, device: Int = 0, values: [DtoAscii.DigitalOutputAction] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.values = values
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceSetAllDigitalOutputsRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceSetAllDigitalOutputsRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceSetAllDigitalOutputsRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceSetAllDigitalOutputsRequest", error: error)
        }
    }
}
