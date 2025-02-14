// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Thrown when a device registers a fault during streamed movement.
 */
public final class StreamMovementFailedException: MotionLibException, @unchecked Sendable {

    /**
     Additional data for StreamMovementFailedException.
     */
    public let details: StreamMovementFailedExceptionData

    /**
     Initializes a new instance of the StreamMovementFailedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Raw unparsed custom data from the native library for the exception.
     */
    public init(message: String, customData: Data) throws {
        self.details = try StreamMovementFailedExceptionData.fromByteArray(customData);
        super.init(message: message)
    }

    /**
     Initializes a new instance of the StreamMovementFailedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Additional data about the exception.
     */
    public init(message: String, customData: StreamMovementFailedExceptionData) {
        self.details = customData;
        super.init(message: message)
    }
}
