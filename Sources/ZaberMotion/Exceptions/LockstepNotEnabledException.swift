// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Thrown when an operation cannot be performed because lockstep motion is not enabled.
 */
public final class LockstepNotEnabledException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the LockstepNotEnabledException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
