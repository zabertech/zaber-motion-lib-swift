/* This file is generated. Do not modify by hand. */

/**
 * Kind of channel to record in the Oscilloscope.
 */
public enum OscilloscopeDataSource: Int, Codable, Sendable {
    /// Records the value of a device or axis setting over time.
    case `setting` = 0
    /// Records the value of an I/O pin over time.
    case `io` = 1
}
