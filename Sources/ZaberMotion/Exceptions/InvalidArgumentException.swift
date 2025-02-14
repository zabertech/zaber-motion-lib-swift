// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Thrown when a function is called with invalid values.
 */
public final class InvalidArgumentException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the InvalidArgumentException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
