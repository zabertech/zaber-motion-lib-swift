// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Thrown when a device receives an invalid command.
 */
public final class BadCommandException: CommandFailedException, @unchecked Sendable {

    /**
     Initializes a new instance of the BadCommandException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Raw unparsed custom data from the native library for the exception.
     */
    public override init(message: String, customData: Data) throws {
        try super.init(message: message, customData: customData)
    }

    /**
     Initializes a new instance of the BadCommandException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Additional data about the exception.
     */
    public override init(message: String, customData: CommandFailedExceptionData) {
        super.init(message: message, customData: customData)
    }
}
