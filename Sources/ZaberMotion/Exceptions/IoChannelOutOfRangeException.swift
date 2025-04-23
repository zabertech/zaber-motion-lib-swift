// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when a device IO operation cannot be performed because the provided channel is not valid.
 */
public final class IoChannelOutOfRangeException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the IoChannelOutOfRangeException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
