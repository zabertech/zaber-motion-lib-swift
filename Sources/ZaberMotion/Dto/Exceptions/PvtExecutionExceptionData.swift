/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

/**
 * Contains additional data for PvtExecutionException.
 */
public struct PvtExecutionExceptionData: Serializable {

    /**
     * The error flag that caused the exception.
     */
    public var errorFlag: String

    /**
     * The reason for the exception.
     */
    public var reason: String

    /**
     * A list of points that cause the error (if applicable).
     */
    public var invalidPoints: [InvalidPvtPoint]

    public init(errorFlag: String = "", reason: String = "", invalidPoints: [InvalidPvtPoint] = []) {
        self.errorFlag = errorFlag
        self.reason = reason
        self.invalidPoints = invalidPoints
    }
}
