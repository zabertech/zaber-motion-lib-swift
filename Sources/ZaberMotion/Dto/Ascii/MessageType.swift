/* This file is generated. Do not modify by hand. */

/**
 * Denotes type of the response message.
 * For more information refer to:
 * [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_message_format).
 */
public enum MessageType: Int, Codable, Sendable {
    case `reply` = 0
    case `info` = 1
    case `alert` = 2
}
