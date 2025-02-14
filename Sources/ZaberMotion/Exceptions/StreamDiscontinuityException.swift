// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Thrown when a stream encounters discontinuity and interrupts the movement.
 */
public final class StreamDiscontinuityException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the StreamDiscontinuityException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
