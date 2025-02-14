// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Thrown when a packet from a device cannot be parsed.
 */
public final class InvalidPacketException: MotionLibException, @unchecked Sendable {

    /**
     Additional data for InvalidPacketException.
     */
    public let details: InvalidPacketExceptionData

    /**
     Initializes a new instance of the InvalidPacketException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Raw unparsed custom data from the native library for the exception.
     */
    public init(message: String, customData: Data) throws {
        self.details = try InvalidPacketExceptionData.fromByteArray(customData);
        super.init(message: message)
    }

    /**
     Initializes a new instance of the InvalidPacketException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Additional data about the exception.
     */
    public init(message: String, customData: InvalidPacketExceptionData) {
        self.details = customData;
        super.init(message: message)
    }
}
