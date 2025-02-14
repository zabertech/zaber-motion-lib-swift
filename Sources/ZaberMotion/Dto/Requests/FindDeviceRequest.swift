/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct FindDeviceRequest: Serializable {
    public var interfaceId: Int
    public var deviceAddress: Int

    public init(interfaceId: Int = 0, deviceAddress: Int = 0) {
        self.interfaceId = interfaceId
        self.deviceAddress = deviceAddress
    }

    public static func fromByteArray(_ byteArray: Data) throws -> FindDeviceRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(FindDeviceRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "FindDeviceRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "FindDeviceRequest", error: error)
        }
    }
}
