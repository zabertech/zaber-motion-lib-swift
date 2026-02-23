/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

/**
 * Represents a message from translator regarding a block translation.
 */
public struct TranslateMessage: Serializable {

    /**
     * The message describing an occurrence.
     */
    public var message: String

    /**
     * The index in the block string that the message regards to.
     */
    public var fromBlock: Int

    /**
     * The end index in the block string that the message regards to.
     * The end index is exclusive.
     */
    public var toBlock: Int

    public init(message: String = "", fromBlock: Int = 0, toBlock: Int = 0) {
        self.message = message
        self.fromBlock = fromBlock
        self.toBlock = toBlock
    }
}
