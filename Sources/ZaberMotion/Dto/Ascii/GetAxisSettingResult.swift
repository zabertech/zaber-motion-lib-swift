// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import UnitsInternal


/**
 * The response from a multi-get axis command.
 */
public struct GetAxisSettingResult: Serializable {

    /**
     * The setting read.
     */
    public var setting: String

    /**
     * The value read.
     * The value is NaN when the device responds with NA, indicating the setting is not supported by the axis.
     */
    public var value: Double

    /**
     * The unit of the values.
     */
    public var unit: Units

    public init(setting: String = "", value: Double = 0.0, unit: Units = Units.native) {
        self.setting = setting
        self.value = value
        self.unit = unit
    }
}
