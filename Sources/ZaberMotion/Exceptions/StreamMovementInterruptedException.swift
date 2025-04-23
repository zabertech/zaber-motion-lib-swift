// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when ongoing stream movement is interrupted by another command or user input.
 */
public final class StreamMovementInterruptedException: MotionLibException, @unchecked Sendable {

    /**
     Additional data for StreamMovementInterruptedException.
     */
    public let details: StreamMovementInterruptedExceptionData

    /**
     Initializes a new instance of the StreamMovementInterruptedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Raw unparsed custom data from the native library for the exception.
     */
    public init(message: String, customData: Data) throws {
        self.details = try StreamMovementInterruptedExceptionData.fromByteArray(customData);
        super.init(message: message)
    }

    /**
     Initializes a new instance of the StreamMovementInterruptedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Additional data about the exception.
     */
    public init(message: String, customData: StreamMovementInterruptedExceptionData) {
        self.details = customData;
        super.init(message: message)
    }
}
