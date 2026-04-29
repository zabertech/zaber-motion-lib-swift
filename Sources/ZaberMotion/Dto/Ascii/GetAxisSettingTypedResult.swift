// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import UnitsInternal


/**
 * The response from a multi-get axis command with typed values.
 */
public struct GetAxisSettingTypedResult: Serializable {

    /**
     * The setting read.
     */
    public var setting: String

    /**
     * The value returned.
     */
    public var value: TypedSetting

    /**
     * The unit of the value.
     */
    public var unit: Units

    public init(setting: String = "", value: TypedSetting = .double(0.0), unit: Units = Units.native) {
        self.setting = setting
        self.value = value
        self.unit = unit
    }
}
