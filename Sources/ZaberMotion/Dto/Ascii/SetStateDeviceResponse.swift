// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * An object containing any non-blocking issues encountered when loading a saved state to a device.
 */
public struct SetStateDeviceResponse: Serializable {

    /**
     * The warnings encountered when applying this state to the given device.
     */
    public var warnings: [String]

    /**
     * A list of axis responses, potentially with warnings encountered
     * when applying this state to the device's axes.
     */
    public var axisResponses: [SetStateAxisResponse]

    public init(warnings: [String] = [], axisResponses: [SetStateAxisResponse] = []) {
        self.warnings = warnings
        self.axisResponses = axisResponses
    }
}
