/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct InterfaceEmptyRequest: Serializable {
    public var interfaceId: Int

    public init(interfaceId: Int = 0) {
        self.interfaceId = interfaceId
    }

    public static func fromByteArray(_ byteArray: Data) throws -> InterfaceEmptyRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(InterfaceEmptyRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "InterfaceEmptyRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "InterfaceEmptyRequest", error: error)
        }
    }
}
