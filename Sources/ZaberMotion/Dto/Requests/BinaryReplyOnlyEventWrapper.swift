// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
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
}
