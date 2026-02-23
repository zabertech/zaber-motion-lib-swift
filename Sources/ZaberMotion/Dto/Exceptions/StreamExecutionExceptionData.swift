/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

/**
 * Contains additional data for StreamExecutionException.
 */
public struct StreamExecutionExceptionData: Serializable {

    /**
     * The error flag that caused the exception.
     */
    public var errorFlag: String

    /**
     * The reason for the exception.
     */
    public var reason: String

    public init(errorFlag: String = "", reason: String = "") {
        self.errorFlag = errorFlag
        self.reason = reason
    }
}
