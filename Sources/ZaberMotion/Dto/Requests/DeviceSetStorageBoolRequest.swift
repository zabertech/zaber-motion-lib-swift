/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DeviceSetStorageBoolRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var key: String
    public var value: Bool

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, key: String = "", value: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.key = key
        self.value = value
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceSetStorageBoolRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceSetStorageBoolRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceSetStorageBoolRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceSetStorageBoolRequest", error: error)
        }
    }
}
