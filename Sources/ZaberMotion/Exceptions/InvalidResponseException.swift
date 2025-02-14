// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Thrown when a device sends a response with unexpected type or data.
 */
public final class InvalidResponseException: MotionLibException, @unchecked Sendable {

    /**
     Additional data for InvalidResponseException.
     */
    public let details: InvalidResponseExceptionData

    /**
     Initializes a new instance of the InvalidResponseException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Raw unparsed custom data from the native library for the exception.
     */
    public init(message: String, customData: Data) throws {
        self.details = try InvalidResponseExceptionData.fromByteArray(customData);
        super.init(message: message)
    }

    /**
     Initializes a new instance of the InvalidResponseException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Additional data about the exception.
     */
    public init(message: String, customData: InvalidResponseExceptionData) {
        self.details = customData;
        super.init(message: message)
    }
}
