// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when a requested operation fails because the device is currently busy.
 */
public final class DeviceBusyException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the DeviceBusyException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
