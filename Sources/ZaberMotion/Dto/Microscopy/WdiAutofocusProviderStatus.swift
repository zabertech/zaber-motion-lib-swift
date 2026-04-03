// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Status of the WDI autofocus.
 */
public struct WdiAutofocusProviderStatus: Serializable {

    /**
     * Indicates whether the autofocus is in range.
     */
    public var inRange: Bool

    /**
     * Indicates whether the laser is turned on.
     */
    public var laserOn: Bool

    public init(inRange: Bool = false, laserOn: Bool = false) {
        self.inRange = inRange
        self.laserOn = laserOn
    }
}
