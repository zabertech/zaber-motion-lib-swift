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
     */
    public var values: [String]

    public init(setting: String = "", values: [String] = []) {
        self.setting = setting
        self.values = values
    }
}
