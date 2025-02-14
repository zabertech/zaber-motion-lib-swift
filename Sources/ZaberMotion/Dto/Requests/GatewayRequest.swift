/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct GatewayRequest: Serializable {
    public var request: String

    public init(request: String = "") {
        self.request = request
    }

    public static func fromByteArray(_ byteArray: Data) throws -> GatewayRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(GatewayRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "GatewayRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "GatewayRequest", error: error)
        }
    }
}
