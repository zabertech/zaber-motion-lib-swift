// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when a parameter of a command is judged to be out of range by the receiving device.
 */
public final class BadDataException: CommandFailedException, @unchecked Sendable {

    /**
     Initializes a new instance of the BadDataException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Raw unparsed custom data from the native library for the exception.
     */
    public override init(message: String, customData: Data) throws {
        try super.init(message: message, customData: customData)
    }

    /**
     Initializes a new instance of the BadDataException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Additional data about the exception.
     */
    public override init(message: String, customData: CommandFailedExceptionData) {
        super.init(message: message, customData: customData)
    }
}
