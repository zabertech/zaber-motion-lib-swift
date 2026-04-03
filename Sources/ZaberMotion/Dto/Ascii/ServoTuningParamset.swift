// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

/**
 * Servo Tuning Parameter Set to target.
 */
public enum ServoTuningParamset: Int, Codable, Sendable {
    /// The currently active servo tuning parameters.
    case `live` = 0
    /// Stored parameter set 1.
    case `p1` = 1
    /// Stored parameter set 2.
    case `p2` = 2
    /// Stored parameter set 3.
    case `p3` = 3
    /// Stored parameter set 4.
    case `p4` = 4
    /// Stored parameter set 5.
    case `p5` = 5
    /// Stored parameter set 6.
    case `p6` = 6
    /// Stored parameter set 7.
    case `p7` = 7
    /// Stored parameter set 8.
    case `p8` = 8
    /// Stored parameter set 9.
    case `p9` = 9
    /// A temporary working area for preparing tuning changes.
    case `staging` = 10
    /// The factory default parameter set.
    case `default` = 11
}
