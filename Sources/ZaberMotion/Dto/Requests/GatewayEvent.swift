/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct GatewayEvent: Serializable {
    public var event: String

    public init(event: String = "") {
        self.event = event
    }

    public static func fromByteArray(_ byteArray: Data) throws -> GatewayEvent {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(GatewayEvent.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "GatewayEvent", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "GatewayEvent", error: error)
        }
    }
}
