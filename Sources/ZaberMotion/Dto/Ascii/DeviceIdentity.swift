/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import Dto


/**
 * Representation of data gathered during device identification.
 */
public struct DeviceIdentity: Serializable {

    /**
     * Unique ID of the device hardware.
     */
    public var deviceId: Int

    /**
     * Serial number of the device.
     */
    public var serialNumber: UInt

    /**
     * Name of the product.
     */
    public var name: String

    /**
     * Number of axes this device has.
     */
    public var axisCount: Int

    /**
     * Version of the firmware.
     */
    public var firmwareVersion: Dto.FirmwareVersion

    /**
     * The device has hardware modifications.
     */
    public var isModified: Bool

    /**
     * The device is an integrated product.
     */
    public var isIntegrated: Bool

    public init(deviceId: Int = 0, serialNumber: UInt = 0, name: String = "", axisCount: Int = 0, firmwareVersion: Dto.FirmwareVersion = FirmwareVersion(), isModified: Bool = false, isIntegrated: Bool = false) {
        self.deviceId = deviceId
        self.serialNumber = serialNumber
        self.name = name
        self.axisCount = axisCount
        self.firmwareVersion = firmwareVersion
        self.isModified = isModified
        self.isIntegrated = isIntegrated
    }
}
