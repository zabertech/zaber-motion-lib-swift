// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when a value cannot be converted using the provided units.
 */
public final class ConversionFailedException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the ConversionFailedException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
