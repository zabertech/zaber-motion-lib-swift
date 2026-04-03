// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Definition of a mock peripheral.
 */
public struct MockPeripheral: Serializable {

    /**
     * A valid Zaber peripheral ID.
     */
    public var peripheralId: Int

    /**
     * The peripheral has hardware modifications. Defaults to false.
     */
    public var isModified: Bool?

    /**
     * The number of microsteps per full step for peripheral. Defaults to device database default.
     */
    public var resolution: Int?

    public init(peripheralId: Int = 0, isModified: Bool? = nil, resolution: Int? = nil) {
        self.peripheralId = peripheralId
        self.isModified = isModified
        self.resolution = resolution
    }
}
