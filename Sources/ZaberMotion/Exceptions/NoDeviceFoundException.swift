// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when no devices can be found on a connection.
 */
public final class NoDeviceFoundException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the NoDeviceFoundException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
