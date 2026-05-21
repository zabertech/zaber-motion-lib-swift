// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

/**
 * Type of acceleration to get or set.
 */
public enum AccelType: Int, Codable, Sendable {
    /// Both acceleration and deceleration.
    case `accelDecel` = 0
    /// Acceleration only.
    case `accelOnly` = 1
    /// Deceleration only.
    case `decelOnly` = 2
}
