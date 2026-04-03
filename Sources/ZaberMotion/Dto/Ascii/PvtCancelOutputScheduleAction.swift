// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Cancel the pending scheduled output change for a single analog or digital output pin in a PVT sequence or buffer.
 */
public struct PvtCancelOutputScheduleAction: Serializable {

    /**
     * The 1-based number of the output pin whose pending scheduled change to cancel.
     */
    public var channel: Int

    /**
     * The type of the output pin to cancel. Must be AO or DO; input types are not valid here.
     */
    public var ioType: IoPortType

    public init(channel: Int = 0, ioType: IoPortType = IoPortType(rawValue: 0)!) {
        self.channel = channel
        self.ioType = ioType
    }
}
