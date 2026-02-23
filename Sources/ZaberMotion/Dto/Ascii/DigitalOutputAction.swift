/* This file is generated. Do not modify by hand. */

/**
 * Action type for digital output.
 */
public enum DigitalOutputAction: Int, Codable, Sendable {
    /// Set the digital output low.
    case `off` = 0
    /// Set the digital output high.
    case `on` = 1
    /// Toggle the current state of the digital output.
    case `toggle` = 2
    /// Leave the digital output in its current state.
    case `keep` = 3
}
