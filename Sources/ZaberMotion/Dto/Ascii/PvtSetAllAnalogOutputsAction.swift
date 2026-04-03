// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import Dto


/**
 * Change the state of multiple pins of an analog output port in a PVT sequence or buffer.
 */
public struct PvtSetAllAnalogOutputsAction: Serializable {

    /**
     * The voltages to set the analog output pins to. Must have one entry per pin in the port.
     */
    public var values: [Dto.Measurement]

    /**
     * If nonzero, specifies the time until the delayed output change occurs.
     */
    public var delay: Dto.Measurement?

    /**
     * The voltages to set the output pins to after the delay time expires. Ignored if the delay is zero or unspecified.
     * Must have one entry per pin in the port.
     */
    public var futureValues: [Dto.Measurement]?

    public init(values: [Dto.Measurement] = [], delay: Dto.Measurement? = nil, futureValues: [Dto.Measurement]? = nil) {
        self.values = values
        self.delay = delay
        self.futureValues = futureValues
    }
}
