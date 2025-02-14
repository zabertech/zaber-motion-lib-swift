/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoBinary


public struct UnknownBinaryResponseEventWrapper: Serializable {
    public var interfaceId: Int
    public var unknownResponse: DtoBinary.UnknownResponseEvent

    public init(interfaceId: Int = 0, unknownResponse: DtoBinary.UnknownResponseEvent = UnknownResponseEvent()) {
        self.interfaceId = interfaceId
        self.unknownResponse = unknownResponse
    }

    public static func fromByteArray(_ byteArray: Data) throws -> UnknownBinaryResponseEventWrapper {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(UnknownBinaryResponseEventWrapper.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "UnknownBinaryResponseEventWrapper", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "UnknownBinaryResponseEventWrapper", error: error)
        }
    }
}
