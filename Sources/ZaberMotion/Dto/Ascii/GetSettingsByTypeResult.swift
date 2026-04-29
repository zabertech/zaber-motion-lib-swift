// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * The response from a multi-get command with values grouped by type.
 */
public struct GetSettingsByTypeResult: Serializable {

    /**
     * Float setting results.
     */
    public var floatSettings: [GetSettingResult]

    /**
     * Integer setting results.
     */
    public var intSettings: [GetSettingIntResult]

    /**
     * Boolean setting results.
     */
    public var boolSettings: [GetSettingBoolResult]

    /**
     * String setting results.
     */
    public var stringSettings: [GetSettingStringResult]

    public init(floatSettings: [GetSettingResult] = [], intSettings: [GetSettingIntResult] = [], boolSettings: [GetSettingBoolResult] = [], stringSettings: [GetSettingStringResult] = []) {
        self.floatSettings = floatSettings
        self.intSettings = intSettings
        self.boolSettings = boolSettings
        self.stringSettings = stringSettings
    }
}
