// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Contains additional data for MovementFailedException.
 */
public struct MovementFailedExceptionData: Serializable {

    /**
     * The full list of warnings.
     */
    public var warnings: [String]

    /**
     * The reason for the Exception.
     */
    public var reason: String

    /**
     * The address of the device that performed the failed movement.
     */
    public var device: Int

    /**
     * The number of the axis that performed the failed movement.
     */
    public var axis: Int

    public init(warnings: [String] = [], reason: String = "", device: Int = 0, axis: Int = 0) {
        self.warnings = warnings
        self.reason = reason
        self.device = device
        self.axis = axis
    }
}
