/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DeviceStorageListKeysRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var prefix: String?

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, prefix: String? = nil) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.prefix = prefix
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceStorageListKeysRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceStorageListKeysRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceStorageListKeysRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceStorageListKeysRequest", error: error)
        }
    }
}
