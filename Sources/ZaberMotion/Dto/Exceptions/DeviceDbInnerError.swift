// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import Dto


/**
 * One of the errors that occurred while trying to access information from the device database.
 */
public struct DeviceDbInnerError: Serializable {

    /**
     * Code describing type of the error.
     */
    public var code: String

    /**
     * The type of database source that caused the error.
     */
    public var sourceType: Dto.DeviceDbSourceType

    /**
     * Description of the error.
     */
    public var message: String

    /**
     * A list of errors that occurred while trying to access information from the device database.
     */
    public var innerErrors: [DeviceDbInnerError]

    public init(code: String = "", sourceType: Dto.DeviceDbSourceType = DeviceDbSourceType(rawValue: 0)!, message: String = "", innerErrors: [DeviceDbInnerError] = []) {
        self.code = code
        self.sourceType = sourceType
        self.message = message
        self.innerErrors = innerErrors
    }
}
