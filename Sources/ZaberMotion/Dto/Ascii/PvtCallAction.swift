/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

/**
 * Represents a buffer call in a PVT sequence or buffer.
 */
public struct PvtCallAction: Serializable {

    /**
     * The number of the buffer to call. A buffer with this number must exist on the device when the call is made.
     */
    public var bufferNumber: Int

    public init(bufferNumber: Int = 0) {
        self.bufferNumber = bufferNumber
    }
}
