/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct CanSetStateRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var state: String

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, state: String = "") {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.state = state
    }

    public static func fromByteArray(_ byteArray: Data) throws -> CanSetStateRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(CanSetStateRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "CanSetStateRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "CanSetStateRequest", error: error)
        }
    }
}
