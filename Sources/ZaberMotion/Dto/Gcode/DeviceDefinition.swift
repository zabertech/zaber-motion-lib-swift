// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import Dto


/**
 * Holds information about device and its axes for purpose of a translator.
 */
public struct DeviceDefinition: Serializable {

    /**
     * Device ID of the controller.
     * Can be obtained from device settings.
     */
    public var deviceId: Int

    /**
     * Applicable axes of the device.
     */
    public var axes: [AxisDefinition]

    /**
     * The smallest of each axis' maxspeed setting value.
     * This value becomes the traverse rate of the translator.
     */
    public var maxSpeed: Dto.Measurement

    public init(deviceId: Int = 0, axes: [AxisDefinition] = [], maxSpeed: Dto.Measurement = Measurement()) {
        self.deviceId = deviceId
        self.axes = axes
        self.maxSpeed = maxSpeed
    }
}
