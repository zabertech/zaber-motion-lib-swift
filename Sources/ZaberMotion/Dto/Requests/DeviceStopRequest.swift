/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DeviceStopRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var waitUntilIdle: Bool

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, waitUntilIdle: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.waitUntilIdle = waitUntilIdle
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceStopRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceStopRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceStopRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceStopRequest", error: error)
        }
    }
}
