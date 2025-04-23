// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when a movement command gets preempted by another command.
 */
public final class CommandPreemptedException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the CommandPreemptedException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
