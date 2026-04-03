// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct AlertEventWrapper: Serializable {
    public var interfaceId: Int

    /**
     * The id of the connection session.
     */
    public var sessionId: Int
    public var alert: DtoAscii.AlertEvent

    public init(interfaceId: Int = 0, sessionId: Int = 0, alert: DtoAscii.AlertEvent = AlertEvent()) {
        self.interfaceId = interfaceId
        self.sessionId = sessionId
        self.alert = alert
    }
}
