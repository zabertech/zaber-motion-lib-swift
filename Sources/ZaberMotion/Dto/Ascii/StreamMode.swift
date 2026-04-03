// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

/**
 * Mode of a stream.
 */
public enum StreamMode: Int, Codable, Sendable {
    /// The stream is not set up.
    case `disabled` = 0
    /// Actions are queued into a stream buffer for later playback.
    case `store` = 1
    /// Actions are queued into a stream buffer for later playback (axes not specified).
    case `storeArbitraryAxes` = 2
    /// Actions are queued and executed on the device immediately.
    case `live` = 3
}
