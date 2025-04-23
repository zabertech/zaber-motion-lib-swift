// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when a device does not respond to a request in time.
 */
public final class RequestTimeoutException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the RequestTimeoutException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
