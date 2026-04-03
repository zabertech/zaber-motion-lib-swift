// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

/**
 * Type of TCP port used to connect to a device on the network.
 */
public enum DevicePortType: Int, Codable, Sendable {
    /// TCP port that communicates only with the connected device.
    case `device` = 0
    /// TCP port that communicates with the connected device and all chained devices.
    case `deviceChain` = 1
}
