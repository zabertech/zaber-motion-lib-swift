// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when device information cannot be retrieved from the device database.
 */
public final class DeviceDbFailedException: MotionLibException, @unchecked Sendable {

    /**
     Additional data for DeviceDbFailedException.
     */
    public let details: DeviceDbFailedExceptionData

    /**
     Initializes a new instance of the DeviceDbFailedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Raw unparsed custom data from the native library for the exception.
     */
    public init(message: String, customData: Data) throws {
        self.details = try DeviceDbFailedExceptionData.fromByteArray(customData);
        super.init(message: message)
    }

    /**
     Initializes a new instance of the DeviceDbFailedException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Additional data about the exception.
     */
    public init(message: String, customData: DeviceDbFailedExceptionData) {
        self.details = customData;
        super.init(message: message)
    }
}
