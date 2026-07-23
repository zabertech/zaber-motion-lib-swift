// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import UnitsInternal


/**
 * The response from a multi-get command.
 */
public struct GetSettingResult: Serializable {

    /**
     * The setting read.
     */
    public var setting: String

    /**
     * The list of values returned.
     * A value is NaN when the device responds with NA, indicating the setting is not supported by the device or an axis.
     */
    public var values: [Double]

    /**
     * The unit of the values.
     */
    public var unit: Units

    public init(setting: String = "", values: [Double] = [], unit: Units = Units.native) {
        self.setting = setting
        self.values = values
        self.unit = unit
    }
}
