// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

/**
 * Type of source of Device DB data.
 */
public enum DeviceDbSourceType: Int, Codable, Sendable {
    /// Fetch device information from a web service.
    case `webService` = 0
    /// Load device information from a local database file.
    case `file` = 1
}
