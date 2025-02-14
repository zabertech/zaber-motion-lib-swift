/* This file is generated. Do not modify by hand. */

/**
 * Named constants for all Zaber Binary protocol reply-only command codes.
 */
public enum ReplyCode: Int, Codable, Sendable {
    case `moveTracking` = 8
    case `limitActive` = 9
    case `manualMoveTracking` = 10
    case `manualMove` = 11
    case `slipTracking` = 12
    case `unexpectedPosition` = 13
    case `error` = 255
}
