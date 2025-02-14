/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DeviceDetectResponse: Serializable {
    public var devices: [Int]

    public init(devices: [Int] = []) {
        self.devices = devices
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceDetectResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceDetectResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceDetectResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceDetectResponse", error: error)
        }
    }
}
