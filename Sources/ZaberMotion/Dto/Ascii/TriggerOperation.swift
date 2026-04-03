// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

/**
 * Operation for trigger action.
 */
public enum TriggerOperation: Int, Codable, Sendable {
    /// Assign the value to the setting (=).
    case `setTo` = 0
    /// Add the value to the current setting value (+=).
    case `incrementBy` = 1
    /// Subtract the value from the current setting value (-=).
    case `decrementBy` = 2
}
