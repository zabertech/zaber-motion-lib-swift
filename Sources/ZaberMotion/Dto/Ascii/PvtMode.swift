/* This file is generated. Do not modify by hand. */

/**
 * Mode of a PVT sequence.
 */
public enum PvtMode: Int, Codable, Sendable {
    /// The PVT sequence is not set up.
    case `disabled` = 0
    /// PVT points are queued into a buffer for later playback.
    case `store` = 1
    /// PVT points are queued and executed on the device immediately.
    case `live` = 2
}
