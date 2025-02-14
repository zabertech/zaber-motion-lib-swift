/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DeviceOnAllResponse: Serializable {
    public var deviceAddresses: [Int]

    public init(deviceAddresses: [Int] = []) {
        self.deviceAddresses = deviceAddresses
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceOnAllResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceOnAllResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceOnAllResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceOnAllResponse", error: error)
        }
    }
}
