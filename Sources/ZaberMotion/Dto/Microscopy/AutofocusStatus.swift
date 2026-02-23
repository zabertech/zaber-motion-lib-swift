/* This file is generated. Do not modify by hand. */

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
