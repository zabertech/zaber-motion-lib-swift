// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Information about an enabled lockstep group.
 */
public struct LockstepInfo: Serializable {

    /**
     * The number that identifies the lockstep group on the device.
     */
    public var group: Int

    /**
     * Axis number of the primary axis.
     */
    public var primaryAxis: Int

    /**
     * Secondary axes of the lockstep group.
     */
    public var secondaries: [LockstepSecondary]

    public init(group: Int = 0, primaryAxis: Int = 0, secondaries: [LockstepSecondary] = []) {
        self.group = group
        self.primaryAxis = primaryAxis
        self.secondaries = secondaries
    }
}
