// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when an operation is not supported by a mode the PVT sequence is currently set up in.
 */
public final class PvtModeException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the PvtModeException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
