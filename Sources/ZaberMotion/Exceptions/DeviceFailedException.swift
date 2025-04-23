// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when a device registers fatal failure.
 Contact support if you observe this exception.
 */
public final class DeviceFailedException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the DeviceFailedException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
