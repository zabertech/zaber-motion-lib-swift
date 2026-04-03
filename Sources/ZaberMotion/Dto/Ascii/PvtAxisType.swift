// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

/**
 * Denotes type of the PVT sequence axis.
 */
public enum PvtAxisType: Int, Codable, Sendable {
    /// A regular physical axis of the device.
    case `physical` = 0
    /// A lockstep group combining multiple physical axes.
    case `lockstep` = 1
}
