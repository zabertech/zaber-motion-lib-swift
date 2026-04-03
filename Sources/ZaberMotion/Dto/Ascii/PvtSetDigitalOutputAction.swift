// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import Dto


/**
 * Change the state of a digital output pin in a PVT sequence or buffer.
 */
public struct PvtSetDigitalOutputAction: Serializable {

    /**
     * The number of the digital output pin to change.
     */
    public var channel: Int

    /**
     * The state to set the digital output pin to.
     */
    public var value: DigitalOutputAction

    /**
     * If nonzero, specifies the time until the delayed output change occurs.
     */
    public var delay: Dto.Measurement?

    /**
     * The state to set the output pin to after the delay time expires. Ignored if the delay is zero or unspecified.
     */
    public var futureValue: DigitalOutputAction?

    public init(channel: Int = 0, value: DigitalOutputAction = DigitalOutputAction(rawValue: 0)!, delay: Dto.Measurement? = nil, futureValue: DigitalOutputAction? = nil) {
        self.channel = channel
        self.value = value
        self.delay = delay
        self.futureValue = futureValue
    }
}
