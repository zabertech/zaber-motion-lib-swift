// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when a movement command for a GE1x series gripper fails.
 */
public final class Ge1GripperMovementFailedException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the Ge1GripperMovementFailedException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
