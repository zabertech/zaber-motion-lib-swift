// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when a streamed motion fails.
 */
public final class StreamExecutionException: MotionLibException, @unchecked Sendable {

    /**
     Additional data for StreamExecutionException.
     */
    public let details: StreamExecutionExceptionData

    /**
     Initializes a new instance of the StreamExecutionException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Raw unparsed custom data from the native library for the exception.
     */
    public init(message: String, customData: Data) throws {
        self.details = try StreamExecutionExceptionData.fromByteArray(customData);
        super.init(message: message)
    }

    /**
     Initializes a new instance of the StreamExecutionException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Additional data about the exception.
     */
    public init(message: String, customData: StreamExecutionExceptionData) {
        self.details = customData;
        super.init(message: message)
    }
}
