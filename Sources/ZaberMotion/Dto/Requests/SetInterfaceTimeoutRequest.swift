/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct SetInterfaceTimeoutRequest: Serializable {
    public var interfaceId: Int
    public var timeout: Int

    public init(interfaceId: Int = 0, timeout: Int = 0) {
        self.interfaceId = interfaceId
        self.timeout = timeout
    }

    public static func fromByteArray(_ byteArray: Data) throws -> SetInterfaceTimeoutRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(SetInterfaceTimeoutRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "SetInterfaceTimeoutRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "SetInterfaceTimeoutRequest", error: error)
        }
    }
}
