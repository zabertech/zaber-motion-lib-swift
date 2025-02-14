/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DeviceGetWarningsRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var clear: Bool

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, clear: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.clear = clear
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceGetWarningsRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceGetWarningsRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceGetWarningsRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceGetWarningsRequest", error: error)
        }
    }
}
