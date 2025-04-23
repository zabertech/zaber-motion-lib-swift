// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when an operation fails due to underlying operating system error.
 */
public final class OsFailedException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the OsFailedException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
