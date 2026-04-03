// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Defines an axis of the translator.
 */
public struct AxisDefinition: Serializable {

    /**
     * ID of the peripheral.
     */
    public var peripheralId: Int

    /**
     * Microstep resolution of the axis.
     * Can be obtained by reading the resolution setting.
     * Leave empty if the axis does not have the setting.
     */
    public var microstepResolution: Int?

    public init(peripheralId: Int = 0, microstepResolution: Int? = nil) {
        self.peripheralId = peripheralId
        self.microstepResolution = microstepResolution
    }
}
