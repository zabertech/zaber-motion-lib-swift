/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DeviceOnAllRequest: Serializable {
    public var interfaceId: Int
    public var waitUntilIdle: Bool

    public init(interfaceId: Int = 0, waitUntilIdle: Bool = false) {
        self.interfaceId = interfaceId
        self.waitUntilIdle = waitUntilIdle
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceOnAllRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceOnAllRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceOnAllRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceOnAllRequest", error: error)
        }
    }
}
