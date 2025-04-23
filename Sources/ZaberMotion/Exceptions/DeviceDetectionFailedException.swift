// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when device detection fails.
 */
public final class DeviceDetectionFailedException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the DeviceDetectionFailedException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
