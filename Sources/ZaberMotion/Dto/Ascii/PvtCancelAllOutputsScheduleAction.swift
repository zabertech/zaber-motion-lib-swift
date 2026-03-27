/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

/**
 * Cancel pending scheduled output changes for multiple analog or digital output pins in a PVT sequence or buffer.
 */
public struct PvtCancelAllOutputsScheduleAction: Serializable {

    /**
     * The type of the output port to cancel. Must be AO or DO; input types are not valid here.
     */
    public var ioType: IoPortType

    /**
     * Specifies which pins to cancel. If absent, all pins in the port are cancelled.
     */
    public var cancel: [Bool]?

    public init(ioType: IoPortType = IoPortType(rawValue: 0)!, cancel: [Bool]? = nil) {
        self.ioType = ioType
        self.cancel = cancel
    }
}
