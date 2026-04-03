// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

/**
 * Denotes type of the response message.
 * For more information refer to:
 * [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_message_format).
 */
public enum MessageType: Int, Codable, Sendable {
    /// A direct response to a command sent to the device.
    case `reply` = 0
    /// An additional data message supplementing a reply.
    case `info` = 1
    /// An unsolicited message from the device reporting a status change.
    case `alert` = 2
}
