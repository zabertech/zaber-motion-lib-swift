// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

/**
 * Mode of the process controller.
 */
public enum ProcessControllerMode: Int, Codable, Sendable {
    /// Allows direct control of the output voltage.
    case `manual` = 0
    /// Closed-loop PID control to maintain a setpoint.
    case `pid` = 1
    /// PID control optimized for heater loads.
    case `pidHeater` = 2
    /// Binary on/off switching based on a threshold.
    case `onOff` = 3
}
