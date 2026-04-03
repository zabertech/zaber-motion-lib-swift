// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * An object containing any non-blocking issues encountered when loading a saved state to an axis.
 */
public struct SetStateAxisResponse: Serializable {

    /**
     * The warnings encountered when applying this state to the given axis.
     */
    public var warnings: [String]

    /**
     * The number of the axis that was set.
     */
    public var axisNumber: Int

    public init(warnings: [String] = [], axisNumber: Int = 0) {
        self.warnings = warnings
        self.axisNumber = axisNumber
    }
}
