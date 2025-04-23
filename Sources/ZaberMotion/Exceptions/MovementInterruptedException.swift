// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when ongoing movement is interrupted by another command or user input.
 */
public final class MovementInterruptedException: MotionLibException, @unchecked Sendable {

    /**
     Additional data for MovementInterruptedException.
     */
    public let details: MovementInterruptedExceptionData

    /**
     Initializes a new instance of the MovementInterruptedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Raw unparsed custom data from the native library for the exception.
     */
    public init(message: String, customData: Data) throws {
        self.details = try MovementInterruptedExceptionData.fromByteArray(customData);
        super.init(message: message)
    }

    /**
     Initializes a new instance of the MovementInterruptedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Additional data about the exception.
     */
    public init(message: String, customData: MovementInterruptedExceptionData) {
        self.details = customData;
        super.init(message: message)
    }
}
