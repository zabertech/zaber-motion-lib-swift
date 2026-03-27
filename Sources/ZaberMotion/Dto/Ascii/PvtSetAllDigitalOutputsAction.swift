/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import Dto


/**
 * Change the state of multiple pins of a digital output port in a PVT sequence or buffer.
 */
public struct PvtSetAllDigitalOutputsAction: Serializable {

    /**
     * The states to set the digital output pins to. Must have one entry per pin in the port.
     */
    public var values: [DigitalOutputAction]

    /**
     * If nonzero, specifies the time until the delayed output change occurs.
     */
    public var delay: Dto.Measurement?

    /**
     * The states to set the output pins to after the delay time expires. Ignored if the delay is zero or unspecified.
     * Must have one entry per pin in the port.
     */
    public var futureValues: [DigitalOutputAction]?

    public init(values: [DigitalOutputAction] = [], delay: Dto.Measurement? = nil, futureValues: [DigitalOutputAction]? = nil) {
        self.values = values
        self.delay = delay
        self.futureValues = futureValues
    }
}
