// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

/**
 * Denotes type of the stream axis.
 */
public enum StreamAxisType: Int, Codable, Sendable {
    /// A regular physical axis of the device.
    case `physical` = 0
    /// A lockstep group combining multiple physical axes.
    case `lockstep` = 1
}
