// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when a PVT sequence generator function fails to find a sequence.
 */
public final class PvtSequenceGenerationFailedException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the PvtSequenceGenerationFailedException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
