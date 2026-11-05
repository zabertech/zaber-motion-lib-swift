// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * A secondary axis of a lockstep group.
 */
public struct LockstepSecondary: Serializable {

    /**
     * Axis number of the secondary axis.
     */
    public var axis: Int

    /**
     * Initial offset of the secondary axis from the primary axis.
     */
    public var offset: Double

    public init(axis: Int = 0, offset: Double = 0.0) {
        self.axis = axis
        self.offset = offset
    }
}
