// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

/**
 * State of a GE1x series gripper.
 */
public enum Ge1GripperState: Int, Codable, Sendable {
    /// The gripper has not been homed and does not have a reference position.
    case `noReferencePosition` = 0
    /// The gripper is currently performing a homing operation.
    case `homing` = 1
    /// The gripper is idle at its target position.
    case `idle` = 2
    /// The gripper is moving to its target position.
    case `moving` = 3
    /// The gripper has detected an object.
    case `objectDetected` = 4
    /// The gripper has detected that an object it was holding has been dropped.
    case `objectDropped` = 5
}
