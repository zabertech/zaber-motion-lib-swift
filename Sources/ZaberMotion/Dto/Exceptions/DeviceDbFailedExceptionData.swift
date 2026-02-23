/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

/**
 * Contains additional data for a DeviceDbFailedException.
 */
public struct DeviceDbFailedExceptionData: Serializable {

    /**
     * Code describing type of the error.
     */
    public var code: String

    /**
     * A list of errors that occurred while trying to access information from the device database.
     */
    public var innerErrors: [DeviceDbInnerError]

    public init(code: String = "", innerErrors: [DeviceDbInnerError] = []) {
        self.code = code
        self.innerErrors = innerErrors
    }
}
