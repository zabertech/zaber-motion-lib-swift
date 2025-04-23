// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when a device cannot be set to the supplied state.
 */
public final class SetDeviceStateFailedException: MotionLibException, @unchecked Sendable {

    /**
     Additional data for SetDeviceStateFailedException.
     */
    public let details: SetDeviceStateExceptionData

    /**
     Initializes a new instance of the SetDeviceStateFailedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Raw unparsed custom data from the native library for the exception.
     */
    public init(message: String, customData: Data) throws {
        self.details = try SetDeviceStateExceptionData.fromByteArray(customData);
        super.init(message: message)
    }

    /**
     Initializes a new instance of the SetDeviceStateFailedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Additional data about the exception.
     */
    public init(message: String, customData: SetDeviceStateExceptionData) {
        self.details = customData;
        super.init(message: message)
    }
}
