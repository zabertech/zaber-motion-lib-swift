// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when a block of G-Code cannot be parsed.
 */
public final class GCodeSyntaxException: MotionLibException, @unchecked Sendable {

    /**
     Additional data for GCodeSyntaxException.
     */
    public let details: GCodeSyntaxExceptionData

    /**
     Initializes a new instance of the GCodeSyntaxException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Raw unparsed custom data from the native library for the exception.
     */
    public init(message: String, customData: Data) throws {
        self.details = try GCodeSyntaxExceptionData.fromByteArray(customData);
        super.init(message: message)
    }

    /**
     Initializes a new instance of the GCodeSyntaxException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Additional data about the exception.
     */
    public init(message: String, customData: GCodeSyntaxExceptionData) {
        self.details = customData;
        super.init(message: message)
    }
}
