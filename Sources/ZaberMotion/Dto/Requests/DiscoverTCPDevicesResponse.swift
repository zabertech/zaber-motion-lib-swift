/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import Dto


public struct DiscoverTCPDevicesResponse: Serializable {
    public var result: [Dto.DeviceDiscoveryResult]

    public init(result: [Dto.DeviceDiscoveryResult] = []) {
        self.result = result
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DiscoverTCPDevicesResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DiscoverTCPDevicesResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DiscoverTCPDevicesResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DiscoverTCPDevicesResponse", error: error)
        }
    }
}
