// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when a PVT sequence motion fails.
 */
public final class PvtExecutionException: MotionLibException, @unchecked Sendable {

    /**
     Additional data for PvtExecutionException.
     */
    public let details: PvtExecutionExceptionData

    /**
     Initializes a new instance of the PvtExecutionException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Raw unparsed custom data from the native library for the exception.
     */
    public init(message: String, customData: Data) throws {
        self.details = try PvtExecutionExceptionData.fromByteArray(customData);
        super.init(message: message)
    }

    /**
     Initializes a new instance of the PvtExecutionException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Additional data about the exception.
     */
    public init(message: String, customData: PvtExecutionExceptionData) {
        self.details = customData;
        super.init(message: message)
    }
}
