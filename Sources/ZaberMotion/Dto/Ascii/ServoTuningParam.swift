// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * A parameter used to establish the servo tuning of an axis.
 */
public struct ServoTuningParam: Serializable {

    /**
     * The name of the parameter to set.
     */
    public var name: String

    /**
     * The value to use for this parameter.
     */
    public var value: Double

    public init(name: String = "", value: Double = 0.0) {
        self.name = name
        self.value = value
    }
}
