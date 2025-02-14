// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Thrown when the library cannot perform an operation on a file.
 */
public final class IoFailedException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the IoFailedException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
