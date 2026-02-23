/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

/**
 * Contains additional data for GCodeExecutionException.
 */
public struct GCodeExecutionExceptionData: Serializable {

    /**
     * The index in the block string that caused the exception.
     */
    public var fromBlock: Int

    /**
     * The end index in the block string that caused the exception.
     * The end index is exclusive.
     */
    public var toBlock: Int

    public init(fromBlock: Int = 0, toBlock: Int = 0) {
        self.fromBlock = fromBlock
        self.toBlock = toBlock
    }
}
