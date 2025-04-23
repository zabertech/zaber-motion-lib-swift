// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when a non-motion device fails to perform a requested operation.
 */
public final class OperationFailedException: MotionLibException, @unchecked Sendable {

    /**
     Additional data for OperationFailedException.
     */
    public let details: OperationFailedExceptionData

    /**
     Initializes a new instance of the OperationFailedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Raw unparsed custom data from the native library for the exception.
     */
    public init(message: String, customData: Data) throws {
        self.details = try OperationFailedExceptionData.fromByteArray(customData);
        super.init(message: message)
    }

    /**
     Initializes a new instance of the OperationFailedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Additional data about the exception.
     */
    public init(message: String, customData: OperationFailedExceptionData) {
        self.details = customData;
        super.init(message: message)
    }
}
