// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when setting up a stream fails.
 */
public final class StreamSetupFailedException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the StreamSetupFailedException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
