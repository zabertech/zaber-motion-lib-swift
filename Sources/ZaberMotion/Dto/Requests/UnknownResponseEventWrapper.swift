/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct UnknownResponseEventWrapper: Serializable {
    public var interfaceId: Int
    public var unknownResponse: DtoAscii.UnknownResponseEvent

    public init(interfaceId: Int = 0, unknownResponse: DtoAscii.UnknownResponseEvent = UnknownResponseEvent()) {
        self.interfaceId = interfaceId
        self.unknownResponse = unknownResponse
    }

    public static func fromByteArray(_ byteArray: Data) throws -> UnknownResponseEventWrapper {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(UnknownResponseEventWrapper.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "UnknownResponseEventWrapper", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "UnknownResponseEventWrapper", error: error)
        }
    }
}
