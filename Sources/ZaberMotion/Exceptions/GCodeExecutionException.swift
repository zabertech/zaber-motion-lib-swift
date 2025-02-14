// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Thrown when a block of G-Code cannot be executed.
 */
public final class GCodeExecutionException: MotionLibException, @unchecked Sendable {

    /**
     Additional data for GCodeExecutionException.
     */
    public let details: GCodeExecutionExceptionData

    /**
     Initializes a new instance of the GCodeExecutionException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Raw unparsed custom data from the native library for the exception.
     */
    public init(message: String, customData: Data) throws {
        self.details = try GCodeExecutionExceptionData.fromByteArray(customData);
        super.init(message: message)
    }

    /**
     Initializes a new instance of the GCodeExecutionException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Additional data about the exception.
     */
    public init(message: String, customData: GCodeExecutionExceptionData) {
        self.details = customData;
        super.init(message: message)
    }
}
