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
     * Requires at least Firmware 6.15 for devices or 6.24 for peripherals.
     */
    public var serialNumber: UInt

    /**
     * Name of the product.
     */
    public var name: String

    /**
     * Version of the firmware.
     */
    public var firmwareVersion: Dto.FirmwareVersion

    /**
     * Indicates whether the device is a peripheral or part of an integrated device.
     */
    public var isPeripheral: Bool

    /**
     * Unique ID of the peripheral hardware.
     */
    public var peripheralId: Int

    /**
     * Name of the peripheral hardware.
     */
    public var peripheralName: String

    /**
     * Determines the type of an device and units it accepts.
     */
    public var deviceType: DeviceType

    public init(deviceId: Int = 0, serialNumber: UInt = 0, name: String = "", firmwareVersion: Dto.FirmwareVersion = FirmwareVersion(), isPeripheral: Bool = false, peripheralId: Int = 0, peripheralName: String = "", deviceType: DeviceType = DeviceType(rawValue: 0)!) {
        self.deviceId = deviceId
        self.serialNumber = serialNumber
        self.name = name
        self.firmwareVersion = firmwareVersion
        self.isPeripheral = isPeripheral
        self.peripheralId = peripheralId
        self.peripheralName = peripheralName
        self.deviceType = deviceType
    }
}
