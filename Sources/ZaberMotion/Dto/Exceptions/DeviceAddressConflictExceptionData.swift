/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

/**
 * Contains additional data for DeviceAddressConflictException.
 */
public struct DeviceAddressConflictExceptionData: Serializable {

    /**
     * The full list of detected device addresses.
     */
    public var deviceAddresses: [Int]

    public init(deviceAddresses: [Int] = []) {
        self.deviceAddresses = deviceAddresses
    }
}
