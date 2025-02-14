// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Thrown when there is a conflict in device numbers preventing unique addressing.
 */
public final class DeviceAddressConflictException: MotionLibException, @unchecked Sendable {

    /**
     Additional data for DeviceAddressConflictException.
     */
    public let details: DeviceAddressConflictExceptionData

    /**
     Initializes a new instance of the DeviceAddressConflictException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Raw unparsed custom data from the native library for the exception.
     */
    public init(message: String, customData: Data) throws {
        self.details = try DeviceAddressConflictExceptionData.fromByteArray(customData);
        super.init(message: message)
    }

    /**
     Initializes a new instance of the DeviceAddressConflictException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Additional data about the exception.
     */
    public init(message: String, customData: DeviceAddressConflictExceptionData) {
        self.details = customData;
        super.init(message: message)
    }
}
