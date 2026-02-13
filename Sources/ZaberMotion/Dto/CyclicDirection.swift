/* This file is generated. Do not modify by hand. */

/**
 * Direction a cyclic device should move when doing an absolute move.
 */
public enum CyclicDirection: Int, Codable, Sendable {
    /// Move to the target in a positive direction.
    case `positive` = 0
    /// Move to the target in a negative direction.
    case `negative` = 1
    /// Take the shortest path to the target position.
    case `shortest` = 2
}
