// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Class representing version of firmware in the controller.
 */
public struct FirmwareVersion: Serializable {

    /**
     * Major version number.
     */
    public var major: Int

    /**
     * Minor version number.
     */
    public var minor: Int

    /**
     * Build version number.
     */
    public var build: Int

    public init(major: Int = 0, minor: Int = 0, build: Int = 0) {
        self.major = major
        self.minor = minor
        self.build = build
    }
}
