// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import Dto


/**
 * Represents a transformation of a translator axis.
 */
public struct AxisTransformation: Serializable {

    /**
     * Letter of the translator axis (X,Y,Z,A,B,C,E).
     */
    public var axisLetter: String

    /**
     * Scaling factor.
     */
    public var scaling: Double?

    /**
     * Translation distance.
     */
    public var translation: Dto.Measurement?

    public init(axisLetter: String = "", scaling: Double? = nil, translation: Dto.Measurement? = nil) {
        self.axisLetter = axisLetter
        self.scaling = scaling
        self.translation = translation
    }
}
