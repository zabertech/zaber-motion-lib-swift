// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Status of the autofocus.
 */
public struct AutofocusStatus: Serializable {

    /**
     * Indicates whether the autofocus is in focus.
     */
    public var inFocus: Bool

    /**
     * Indicates whether the autofocus is in range.
     */
    public var inRange: Bool

    public init(inFocus: Bool = false, inRange: Bool = false) {
        self.inFocus = inFocus
        self.inRange = inRange
    }
}
