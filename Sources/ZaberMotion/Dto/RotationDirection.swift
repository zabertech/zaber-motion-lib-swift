/* This file is generated. Do not modify by hand. */

/**
 * Direction of rotation.
 */
public enum RotationDirection: Int, Codable, Sendable {
    case `clockwise` = 0
    case `counterclockwise` = 1
    public static var cw: RotationDirection { .clockwise } // = 0
    public static var ccw: RotationDirection { .counterclockwise } // = 1
}
