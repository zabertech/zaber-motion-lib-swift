// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when a device rejects a command.
 */
public class CommandFailedException: MotionLibException, @unchecked Sendable {

    /**
     Additional data for CommandFailedException.
     */
    public let details: CommandFailedExceptionData

    /**
     Initializes a new instance of the CommandFailedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Raw unparsed custom data from the native library for the exception.
     */
    public init(message: String, customData: Data) throws {
        self.details = try CommandFailedExceptionData.fromByteArray(customData);
        super.init(message: message)
    }

    /**
     Initializes a new instance of the CommandFailedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Additional data about the exception.
     */
    public init(message: String, customData: CommandFailedExceptionData) {
        self.details = customData;
        super.init(message: message)
    }
}
