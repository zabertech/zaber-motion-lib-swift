// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

/**
 * Mode of logging output of the library.
 */
public enum LogOutputMode: Int, Codable, Sendable {
    /// Discard all log output.
    case `off` = 0
    /// Write logs to standard output.
    case `stdout` = 1
    /// Write logs to standard error.
    case `stderr` = 2
    /// Write logs to a specified file.
    case `file` = 3
}
