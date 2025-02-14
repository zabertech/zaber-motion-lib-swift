/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DeviceEmptyRequest: Serializable {
    public var interfaceId: Int
    public var device: Int

    public init(interfaceId: Int = 0, device: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceEmptyRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceEmptyRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceEmptyRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceEmptyRequest", error: error)
        }
    }
}
