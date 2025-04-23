// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when a device rejects a binary command with an error.
 */
public final class BinaryCommandFailedException: MotionLibException, @unchecked Sendable {

    /**
     Additional data for BinaryCommandFailedException.
     */
    public let details: BinaryCommandFailedExceptionData

    /**
     Initializes a new instance of the BinaryCommandFailedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Raw unparsed custom data from the native library for the exception.
     */
    public init(message: String, customData: Data) throws {
        self.details = try BinaryCommandFailedExceptionData.fromByteArray(customData);
        super.init(message: message)
    }

    /**
     Initializes a new instance of the BinaryCommandFailedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Additional data about the exception.
     */
    public init(message: String, customData: BinaryCommandFailedExceptionData) {
        self.details = customData;
        super.init(message: message)
    }
}
