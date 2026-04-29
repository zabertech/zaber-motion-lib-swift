// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * The response from a multi-get command with boolean values.
 */
public struct GetSettingBoolResult: Serializable {

    /**
     * The setting read.
     */
    public var setting: String

    /**
     * The list of values returned.
     */
    public var values: [Bool]

    public init(setting: String = "", values: [Bool] = []) {
        self.setting = setting
        self.values = values
    }
}
