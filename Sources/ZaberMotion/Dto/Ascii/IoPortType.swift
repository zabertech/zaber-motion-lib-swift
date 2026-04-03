// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

/**
 * Kind of I/O pin to use.
 */
public enum IoPortType: Int, Codable, Sendable {
    /// No port type specified.
    case `none` = 0
    /// An analog input channel that reads a voltage.
    case `analogInput` = 1
    /// An analog output channel that outputs a voltage.
    case `analogOutput` = 2
    /// A digital input channel that reads a boolean state.
    case `digitalInput` = 3
    /// A digital output channel that controls a boolean state.
    case `digitalOutput` = 4
}
