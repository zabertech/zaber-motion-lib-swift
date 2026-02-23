/* This file is generated. Do not modify by hand. */

/**
 * Denotes type of an device and units it accepts.
 */
public enum DeviceType: Int, Codable, Sendable {
    /// Device type could not be determined.
    case `unknown` = 0
    /// A linear device that accepts length units for position.
    case `linear` = 1
    /// A rotary device that accepts angle units for position.
    case `rotary` = 2
}
