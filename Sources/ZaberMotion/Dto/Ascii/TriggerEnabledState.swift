// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * The enabled state of a single trigger.
 * Returns whether the given trigger is enabled and the number of times it will fire.
 * This is a subset of the complete state, and is faster to query.
 */
public struct TriggerEnabledState: Serializable {

    /**
     * The enabled state for a trigger.
     */
    public var enabled: Bool

    /**
     * The number of remaining fires for this trigger.
     * A value of -1 indicates unlimited fires remaining.
     */
    public var firesRemaining: Int

    public init(enabled: Bool = false, firesRemaining: Int = 0) {
        self.enabled = enabled
        self.firesRemaining = firesRemaining
    }
}
