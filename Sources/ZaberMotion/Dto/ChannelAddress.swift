// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Holds device address and IO channel number.
 */
public struct ChannelAddress: Serializable {

    /**
     * Device address.
     */
    public var device: Int

    /**
     * IO channel number.
     */
    public var channel: Int

    public init(device: Int = 0, channel: Int = 0) {
        self.device = device
        self.channel = channel
    }
}
