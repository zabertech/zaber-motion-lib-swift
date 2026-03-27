/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import Dto


/**
 * Change the state of an analog output pin in a PVT sequence or buffer.
 */
public struct PvtSetAnalogOutputAction: Serializable {

    /**
     * The number of the analog output pin to change.
     */
    public var channel: Int

    /**
     * The voltage to set the analog output pin to.
     */
    public var value: Dto.Measurement

    /**
     * If nonzero, specifies the time until the delayed output change occurs.
     */
    public var delay: Dto.Measurement?

    /**
     * The voltage to set the output pin to after the delay time expires. Ignored if the delay is zero or unspecified.
     */
    public var futureValue: Dto.Measurement?

    public init(channel: Int = 0, value: Dto.Measurement = Measurement(), delay: Dto.Measurement? = nil, futureValue: Dto.Measurement? = nil) {
        self.channel = channel
        self.value = value
        self.delay = delay
        self.futureValue = futureValue
    }
}
