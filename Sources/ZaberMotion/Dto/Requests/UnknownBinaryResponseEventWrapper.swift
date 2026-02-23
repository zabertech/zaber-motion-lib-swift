/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoBinary


public struct UnknownBinaryResponseEventWrapper: Serializable {
    public var interfaceId: Int

    /**
     * The id of the connection session.
     */
    public var sessionId: Int
    public var unknownResponse: DtoBinary.UnknownResponseEvent

    public init(interfaceId: Int = 0, sessionId: Int = 0, unknownResponse: DtoBinary.UnknownResponseEvent = UnknownResponseEvent()) {
        self.interfaceId = interfaceId
        self.sessionId = sessionId
        self.unknownResponse = unknownResponse
    }
}
