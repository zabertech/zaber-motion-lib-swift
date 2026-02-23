/* This file is generated. Do not modify by hand. */

/**
 * Denotes type of an axis and units it accepts.
 */
public enum AxisType: Int, Codable, Sendable {
    /// Axis type could not be determined.
    case `unknown` = 0
    /// A linear axis that accepts length units for position.
    case `linear` = 1
    /// A rotary axis that accepts angle units for position.
    case `rotary` = 2
    /// A process on a process controller.
    case `process` = 3
    /// A lamp on a light source controller.
    case `lamp` = 4
}
