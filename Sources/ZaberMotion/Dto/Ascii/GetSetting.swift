// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import UnitsInternal


/**
 * Specifies a setting to get with one of the multi-get commands.
 */
public struct GetSetting: Serializable {

    /**
     * The setting to read.
     */
    public var setting: String

    /**
     * The list of axes to read.
     */
    public var axes: [Int]?

    /**
     * The unit to convert the read settings to.
     */
    public var unit: Units?

    public init(setting: String = "", axes: [Int]? = nil, unit: Units? = nil) {
        self.setting = setting
        self.axes = axes
        self.unit = unit
    }
}
