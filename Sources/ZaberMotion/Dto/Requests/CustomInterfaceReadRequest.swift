/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct CustomInterfaceReadRequest: Serializable {
    public var transportId: Int

    public init(transportId: Int = 0) {
        self.transportId = transportId
    }

    public static func fromByteArray(_ byteArray: Data) throws -> CustomInterfaceReadRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(CustomInterfaceReadRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "CustomInterfaceReadRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "CustomInterfaceReadRequest", error: error)
        }
    }
}
