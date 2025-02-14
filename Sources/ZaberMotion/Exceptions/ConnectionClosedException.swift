// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Thrown when attempting to communicate on a closed connection.
 */
public final class ConnectionClosedException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the ConnectionClosedException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
