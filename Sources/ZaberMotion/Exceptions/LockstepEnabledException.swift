// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when an operation cannot be performed because lockstep motion is enabled.
 */
public final class LockstepEnabledException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the LockstepEnabledException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
