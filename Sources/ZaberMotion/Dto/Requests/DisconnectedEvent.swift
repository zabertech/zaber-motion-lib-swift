// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoExceptions


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
     * The error that caused the disconnection.
     */
    public var error: DtoExceptions.ExceptionWireFormat

    public init(interfaceId: Int = 0, sessionId: Int = 0, error: DtoExceptions.ExceptionWireFormat = ExceptionWireFormat()) {
        self.interfaceId = interfaceId
        self.sessionId = sessionId
        self.error = error
    }
}
