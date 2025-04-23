// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when the library is overwhelmed with too many simultaneous requests.
 */
public final class OutOfRequestIdsException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the OutOfRequestIdsException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
