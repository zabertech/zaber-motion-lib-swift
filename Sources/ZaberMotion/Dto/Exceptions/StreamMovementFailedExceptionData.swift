// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Contains additional data for StreamMovementFailedException.
 */
public struct StreamMovementFailedExceptionData: Serializable {

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
