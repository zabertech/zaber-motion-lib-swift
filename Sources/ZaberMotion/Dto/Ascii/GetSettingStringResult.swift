// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * The response from a multi-get command with string values.
 */
public struct GetSettingStringResult: Serializable {

    /**
     * The setting read.
     */
    public var setting: String

    /**
     * The list of values returned.
     * A value is null when the device responds with NA, indicating the setting is not supported by the device or an axis.
     */
    public var values: [String?]

    public init(setting: String = "", values: [String?] = []) {
        self.setting = setting
        self.values = values
    }
}
