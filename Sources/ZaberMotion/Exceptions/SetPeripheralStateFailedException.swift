// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Thrown when an axis cannot be set to the supplied state.
 */
public final class SetPeripheralStateFailedException: MotionLibException, @unchecked Sendable {

    /**
     Additional data for SetPeripheralStateFailedException.
     */
    public let details: SetPeripheralStateExceptionData

    /**
     Initializes a new instance of the SetPeripheralStateFailedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Raw unparsed custom data from the native library for the exception.
     */
    public init(message: String, customData: Data) throws {
        self.details = try SetPeripheralStateExceptionData.fromByteArray(customData);
        super.init(message: message)
    }

    /**
     Initializes a new instance of the SetPeripheralStateFailedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Additional data about the exception.
     */
    public init(message: String, customData: SetPeripheralStateExceptionData) {
        self.details = customData;
        super.init(message: message)
    }
}
