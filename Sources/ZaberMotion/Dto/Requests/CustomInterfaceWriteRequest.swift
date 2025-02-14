/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct CustomInterfaceWriteRequest: Serializable {
    public var transportId: Int
    public var message: String

    public init(transportId: Int = 0, message: String = "") {
        self.transportId = transportId
        self.message = message
    }

    public static func fromByteArray(_ byteArray: Data) throws -> CustomInterfaceWriteRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(CustomInterfaceWriteRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "CustomInterfaceWriteRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "CustomInterfaceWriteRequest", error: error)
        }
    }
}
