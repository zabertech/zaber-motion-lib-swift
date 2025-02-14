/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DeviceStorageRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var key: String

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, key: String = "") {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.key = key
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceStorageRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceStorageRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceStorageRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceStorageRequest", error: error)
        }
    }
}
