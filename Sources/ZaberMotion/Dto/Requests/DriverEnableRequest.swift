/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DriverEnableRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var timeout: Double

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, timeout: Double = 0.0) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.timeout = timeout
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DriverEnableRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DriverEnableRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DriverEnableRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DriverEnableRequest", error: error)
        }
    }
}
