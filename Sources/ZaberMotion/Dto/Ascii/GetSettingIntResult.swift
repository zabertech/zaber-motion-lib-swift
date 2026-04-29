// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * The response from a multi-get command with integer values.
 */
public struct GetSettingIntResult: Serializable {

    /**
     * The setting read.
     */
    public var setting: String

    /**
     * The list of values returned.
     */
    public var values: [Int64]

    public init(setting: String = "", values: [Int64] = []) {
        self.setting = setting
        self.values = values
    }
}
