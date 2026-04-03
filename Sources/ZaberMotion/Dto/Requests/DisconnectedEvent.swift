// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Event that is sent when a connection is lost.
 */
public struct DisconnectedEvent: Serializable {

    /**
     * The id of the interface that was disconnected.
     */
    public var interfaceId: Int

    /**
     * The id of the connection session.
     */
    public var sessionId: Int

    /**
     * The type of error that caused the disconnection.
     */
    public var errorType: Errors

    /**
     * The message describing the error.
     */
    public var errorMessage: String

    public init(interfaceId: Int = 0, sessionId: Int = 0, errorType: Errors = Errors(rawValue: 0)!, errorMessage: String = "") {
        self.interfaceId = interfaceId
        self.sessionId = sessionId
        self.errorType = errorType
        self.errorMessage = errorMessage
    }
}
