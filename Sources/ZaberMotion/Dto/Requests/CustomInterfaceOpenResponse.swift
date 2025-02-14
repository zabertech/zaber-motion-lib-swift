/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct CustomInterfaceOpenResponse: Serializable {
    public var transportId: Int

    public init(transportId: Int = 0) {
        self.transportId = transportId
    }

    public static func fromByteArray(_ byteArray: Data) throws -> CustomInterfaceOpenResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(CustomInterfaceOpenResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "CustomInterfaceOpenResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "CustomInterfaceOpenResponse", error: error)
        }
    }
}
