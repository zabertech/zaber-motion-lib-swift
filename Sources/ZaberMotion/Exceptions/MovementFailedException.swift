// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when a device registers a fault during movement.
 */
public final class MovementFailedException: MotionLibException, @unchecked Sendable {

    /**
     Additional data for MovementFailedException.
     */
    public let details: MovementFailedExceptionData

    /**
     Initializes a new instance of the MovementFailedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Raw unparsed custom data from the native library for the exception.
     */
    public init(message: String, customData: Data) throws {
        self.details = try MovementFailedExceptionData.fromByteArray(customData);
        super.init(message: message)
    }

    /**
     Initializes a new instance of the MovementFailedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Additional data about the exception.
     */
    public init(message: String, customData: MovementFailedExceptionData) {
        self.details = customData;
        super.init(message: message)
    }
}
