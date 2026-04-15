// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

/**
 * Error for a GE1x series gripper.
 */
public enum Ge1xGripperError: Int, Codable, Sendable {
    /// No error.
    case `none` = 0
    /// The gripper supply voltage is too low.
    case `undervoltage` = 1
    /// The gripper supply voltage is too high.
    case `overvoltage` = 2
    /// The gripper is drawing too much current.
    case `overcurrent` = 3
    /// The gripper temperature is too high.
    case `overtemperature` = 4
    /// There is a 3-phase imbalance in the motor.
    case `motorPhaseLoss` = 10
    /// The gripper has exceeded its rated speed.
    case `overspeed` = 11
    /// There is an error with the gripper encoder.
    case `encoderError` = 32
    /// There is a communication error with the gripper encoder.
    case `encoderCommunicationError` = 33
    /// The gripper current sampling offset is abnormal.
    case `samplingCircuitError` = 34
    /// There is an error with the gripper driver circuit.
    case `driverCircuitError` = 35
    /// There is an error with the gripper flash memory.
    case `flashChipError` = 36
    /// There is an error with the gripper file system.
    case `fileSystemError` = 37
}
