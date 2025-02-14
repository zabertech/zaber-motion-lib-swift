/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct SetStateRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var state: String
    public var deviceOnly: Bool

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, state: String = "", deviceOnly: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.state = state
        self.deviceOnly = deviceOnly
    }

    public static func fromByteArray(_ byteArray: Data) throws -> SetStateRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(SetStateRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "SetStateRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "SetStateRequest", error: error)
        }
    }
}
