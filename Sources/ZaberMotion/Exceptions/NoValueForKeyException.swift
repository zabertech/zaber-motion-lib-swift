// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when trying to access a key that has not been set.
 */
public final class NoValueForKeyException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the NoValueForKeyException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
