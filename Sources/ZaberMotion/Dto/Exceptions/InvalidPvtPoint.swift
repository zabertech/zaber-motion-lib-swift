// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Contains invalid PVT points for PvtExecutionException.
 */
public struct InvalidPvtPoint: Serializable {

    /**
     * Index of the point numbered from the last submitted point.
     */
    public var index: Int

    /**
     * The textual representation of the point.
     */
    public var point: String

    public init(index: Int = 0, point: String = "") {
        self.index = index
        self.point = point
    }
}
