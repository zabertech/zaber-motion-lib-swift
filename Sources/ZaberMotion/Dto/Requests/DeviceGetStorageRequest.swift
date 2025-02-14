/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DeviceGetStorageRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var key: String
    public var decode: Bool

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, key: String = "", decode: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.key = key
        self.decode = decode
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceGetStorageRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceGetStorageRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceGetStorageRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceGetStorageRequest", error: error)
        }
    }
}
