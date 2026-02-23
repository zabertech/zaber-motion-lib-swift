/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import UnitsInternal


/**
 * Specifies a setting to get with one of the multi-get commands.
 */
public struct GetAxisSetting: Serializable {

    /**
     * The setting to read.
     */
    public var setting: String

    /**
     * The unit to convert the read setting to.
     */
    public var unit: Units?

    public init(setting: String = "", unit: Units? = nil) {
        self.setting = setting
        self.unit = unit
    }
}
