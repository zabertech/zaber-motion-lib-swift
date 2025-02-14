// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Thrown when ongoing PVT movement is interrupted by another command or user input.
 */
public final class PvtMovementInterruptedException: MotionLibException, @unchecked Sendable {

    /**
     Additional data for PvtMovementInterruptedException.
     */
    public let details: PvtMovementInterruptedExceptionData

    /**
     Initializes a new instance of the PvtMovementInterruptedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Raw unparsed custom data from the native library for the exception.
     */
    public init(message: String, customData: Data) throws {
        self.details = try PvtMovementInterruptedExceptionData.fromByteArray(customData);
        super.init(message: message)
    }

    /**
     Initializes a new instance of the PvtMovementInterruptedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Additional data about the exception.
     */
    public init(message: String, customData: PvtMovementInterruptedExceptionData) {
        self.details = customData;
        super.init(message: message)
    }
}
