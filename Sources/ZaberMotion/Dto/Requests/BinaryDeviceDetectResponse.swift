/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct BinaryDeviceDetectResponse: Serializable {
    public var devices: [Int]

    public init(devices: [Int] = []) {
        self.devices = devices
    }

    public static func fromByteArray(_ byteArray: Data) throws -> BinaryDeviceDetectResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(BinaryDeviceDetectResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "BinaryDeviceDetectResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "BinaryDeviceDetectResponse", error: error)
        }
    }
}
