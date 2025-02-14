// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Thrown for various timeouts across the library excluding request to a device (see RequestTimeoutException).
 */
public final class TimeoutException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the TimeoutException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
