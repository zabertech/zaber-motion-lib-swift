// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct UnknownResponseEventWrapper: Serializable {
    public var interfaceId: Int

    /**
     * The id of the connection session.
     */
    public var sessionId: Int
    public var unknownResponse: DtoAscii.UnknownResponseEvent

    public init(interfaceId: Int = 0, sessionId: Int = 0, unknownResponse: DtoAscii.UnknownResponseEvent = UnknownResponseEvent()) {
        self.interfaceId = interfaceId
        self.sessionId = sessionId
        self.unknownResponse = unknownResponse
    }
}
