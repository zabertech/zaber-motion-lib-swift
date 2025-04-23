// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when a command is too long to be written by the ASCII protocol, even when continued across multiple lines.
 */
public final class CommandTooLongException: MotionLibException, @unchecked Sendable {

    /**
     Additional data for CommandTooLongException.
     */
    public let details: CommandTooLongExceptionData

    /**
     Initializes a new instance of the CommandTooLongException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Raw unparsed custom data from the native library for the exception.
     */
    public init(message: String, customData: Data) throws {
        self.details = try CommandTooLongExceptionData.fromByteArray(customData);
        super.init(message: message)
    }

    /**
     Initializes a new instance of the CommandTooLongException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Additional data about the exception.
     */
    public init(message: String, customData: CommandTooLongExceptionData) {
        self.details = customData;
        super.init(message: message)
    }
}
