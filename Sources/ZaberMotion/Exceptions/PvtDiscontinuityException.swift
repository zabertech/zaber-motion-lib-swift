// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when a PVT sequence encounters discontinuity and interrupts the sequence.
 */
public final class PvtDiscontinuityException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the PvtDiscontinuityException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
