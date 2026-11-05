// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * A serialized exception with its type, message, and optional custom data.
 */
public struct ExceptionWireFormat: Serializable {

    /**
     * The error type of the exception.
     */
    public var type: Int

    /**
     * The exception message.
     */
    public var message: String

    /**
     * The structured custom data for the exception, or unset if none.
     */
    public var customData: ExceptionData?

    /**
     * The exceptions bundled in an aggregate exception. Empty for other exceptions.
     */
    public var innerExceptions: [ExceptionWireFormat]

    public init(type: Int = 0, message: String = "", customData: ExceptionData? = nil, innerExceptions: [ExceptionWireFormat] = []) {
        self.type = type
        self.message = message
        self.customData = customData
        self.innerExceptions = innerExceptions
    }
}
