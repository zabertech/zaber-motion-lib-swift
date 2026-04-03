// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

/**
 * Direction of rotation.
 */
public enum RotationDirection: Int, Codable, Sendable {
    /// Rotate in the clockwise direction.
    case `clockwise` = 0
    /// Rotate in the counterclockwise direction.
    case `counterclockwise` = 1
    /// Shorthand alias for Clockwise.
    public static var cw: RotationDirection { .clockwise } // = 0
    /// Shorthand alias for Counterclockwise.
    public static var ccw: RotationDirection { .counterclockwise } // = 1
}
