/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct CustomInterfaceCloseRequest: Serializable {
    public var transportId: Int
    public var errorMessage: String

    public init(transportId: Int = 0, errorMessage: String = "") {
        self.transportId = transportId
        self.errorMessage = errorMessage
    }

    public static func fromByteArray(_ byteArray: Data) throws -> CustomInterfaceCloseRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(CustomInterfaceCloseRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "CustomInterfaceCloseRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "CustomInterfaceCloseRequest", error: error)
        }
    }
}
