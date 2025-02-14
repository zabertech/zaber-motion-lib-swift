// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Thrown when a connection breaks during a request.
 */
public class ConnectionFailedException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the ConnectionFailedException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
