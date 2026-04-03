// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

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
