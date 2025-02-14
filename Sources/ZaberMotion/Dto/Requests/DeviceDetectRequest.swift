/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DeviceDetectRequest: Serializable {
    public var interfaceId: Int
    public var identifyDevices: Bool
    public var type: DeviceType

    public init(interfaceId: Int = 0, identifyDevices: Bool = false, type: DeviceType = DeviceType(rawValue: 0)!) {
        self.interfaceId = interfaceId
        self.identifyDevices = identifyDevices
        self.type = type
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceDetectRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceDetectRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceDetectRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceDetectRequest", error: error)
        }
    }
}
