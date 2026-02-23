/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

/**
 * Holds device address and axis number.
 */
public struct AxisAddress: Serializable {

    /**
     * Device address.
     */
    public var device: Int

    /**
     * Axis number.
     */
    public var axis: Int

    public init(device: Int = 0, axis: Int = 0) {
        self.device = device
        self.axis = axis
    }
}
