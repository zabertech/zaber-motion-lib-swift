/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoBinary


public struct BinaryReplyOnlyEventWrapper: Serializable {
    public var interfaceId: Int

    /**
     * The id of the connection session.
     */
    public var sessionId: Int
    public var reply: DtoBinary.ReplyOnlyEvent

    public init(interfaceId: Int = 0, sessionId: Int = 0, reply: DtoBinary.ReplyOnlyEvent = ReplyOnlyEvent()) {
        self.interfaceId = interfaceId
        self.sessionId = sessionId
        self.reply = reply
    }

    public static func fromByteArray(_ byteArray: Data) throws -> BinaryReplyOnlyEventWrapper {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(BinaryReplyOnlyEventWrapper.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "BinaryReplyOnlyEventWrapper", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "BinaryReplyOnlyEventWrapper", error: error)
        }
    }
}
