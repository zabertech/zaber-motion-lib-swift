// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Class representing information on the I/O channels of the device.
 */
public struct DeviceIOInfo: Serializable {

    /**
     * Number of analog output channels.
     */
    public var numberAnalogOutputs: Int

    /**
     * Number of analog input channels.
     */
    public var numberAnalogInputs: Int

    /**
     * Number of digital output channels.
     */
    public var numberDigitalOutputs: Int

    /**
     * Number of digital input channels.
     */
    public var numberDigitalInputs: Int

    public init(numberAnalogOutputs: Int = 0, numberAnalogInputs: Int = 0, numberDigitalOutputs: Int = 0, numberDigitalInputs: Int = 0) {
        self.numberAnalogOutputs = numberAnalogOutputs
        self.numberAnalogInputs = numberAnalogInputs
        self.numberDigitalOutputs = numberDigitalOutputs
        self.numberDigitalInputs = numberDigitalInputs
    }
}
