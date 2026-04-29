// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import UnitsInternal


/**
 * The response from a multi-get command with typed values.
 */
public struct GetSettingTypedResult: Serializable {

    /**
     * The setting read.
     */
    public var setting: String

    /**
     * The list of values returned.
     */
    public var values: [TypedSetting]

    /**
     * The unit of the values.
     */
    public var unit: Units

    public init(setting: String = "", values: [TypedSetting] = [], unit: Units = Units.native) {
        self.setting = setting
        self.values = values
        self.unit = unit
    }
}
