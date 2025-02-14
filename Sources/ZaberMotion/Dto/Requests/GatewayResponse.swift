/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct GatewayResponse: Serializable {
    public var response: ResponseType
    public var errorType: Errors
    public var errorMessage: String

    public init(response: ResponseType = ResponseType(rawValue: 0)!, errorType: Errors = Errors(rawValue: 0)!, errorMessage: String = "") {
        self.response = response
        self.errorType = errorType
        self.errorMessage = errorMessage
    }

    public static func fromByteArray(_ byteArray: Data) throws -> GatewayResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(GatewayResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "GatewayResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "GatewayResponse", error: error)
        }
    }
}
