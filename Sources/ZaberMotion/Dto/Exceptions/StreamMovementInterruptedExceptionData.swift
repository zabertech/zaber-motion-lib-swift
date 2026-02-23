/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

/**
 * Contains additional data for StreamMovementInterruptedException.
 */
public struct StreamMovementInterruptedExceptionData: Serializable {

    /**
     * The full list of warnings.
     */
    public var warnings: [String]

    /**
     * The reason for the Exception.
     */
    public var reason: String

    public init(warnings: [String] = [], reason: String = "") {
        self.warnings = warnings
        self.reason = reason
    }
}
