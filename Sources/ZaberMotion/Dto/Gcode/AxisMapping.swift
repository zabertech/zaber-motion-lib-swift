// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Maps a translator axis to a Zaber stream axis.
 */
public struct AxisMapping: Serializable {

    /**
     * Letter of the translator axis (X,Y,Z,A,B,C,E).
     */
    public var axisLetter: String

    /**
     * Index of the stream axis.
     */
    public var axisIndex: Int

    public init(axisLetter: String = "", axisIndex: Int = 0) {
        self.axisLetter = axisLetter
        self.axisIndex = axisIndex
    }
}
