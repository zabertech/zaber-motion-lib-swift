/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct RenumberRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var address: Int

    public init(interfaceId: Int = 0, device: Int = 0, address: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.address = address
    }

    public static func fromByteArray(_ byteArray: Data) throws -> RenumberRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(RenumberRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "RenumberRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "RenumberRequest", error: error)
        }
    }
}
