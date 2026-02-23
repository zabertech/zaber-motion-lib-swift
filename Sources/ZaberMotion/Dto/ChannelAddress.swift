/* This file is generated. Do not modify by hand. */

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
