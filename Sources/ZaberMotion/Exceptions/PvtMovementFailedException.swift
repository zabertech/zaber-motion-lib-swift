// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Thrown when a device registers a fault during PVT movement.
 */
public final class PvtMovementFailedException: MotionLibException, @unchecked Sendable {

    /**
     Additional data for PvtMovementFailedException.
     */
    public let details: PvtMovementFailedExceptionData

    /**
     Initializes a new instance of the PvtMovementFailedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Raw unparsed custom data from the native library for the exception.
     */
    public init(message: String, customData: Data) throws {
        self.details = try PvtMovementFailedExceptionData.fromByteArray(customData);
        super.init(message: message)
    }

    /**
     Initializes a new instance of the PvtMovementFailedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Additional data about the exception.
     */
    public init(message: String, customData: PvtMovementFailedExceptionData) {
        self.details = customData;
        super.init(message: message)
    }
}
