/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import Dto


public struct DeviceIdentifyRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var assumeVersion: Dto.FirmwareVersion?

    public init(interfaceId: Int = 0, device: Int = 0, assumeVersion: Dto.FirmwareVersion? = nil) {
        self.interfaceId = interfaceId
        self.device = device
        self.assumeVersion = assumeVersion
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceIdentifyRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceIdentifyRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceIdentifyRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceIdentifyRequest", error: error)
        }
    }
}
