/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct BinaryDeviceDetectRequest: Serializable {
    public var interfaceId: Int
    public var identifyDevices: Bool

    public init(interfaceId: Int = 0, identifyDevices: Bool = false) {
        self.interfaceId = interfaceId
        self.identifyDevices = identifyDevices
    }

    public static func fromByteArray(_ byteArray: Data) throws -> BinaryDeviceDetectRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(BinaryDeviceDetectRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "BinaryDeviceDetectRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "BinaryDeviceDetectRequest", error: error)
        }
    }
}
