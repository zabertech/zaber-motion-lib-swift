// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Thrown when incoming device data cannot be parsed as expected.
 */
public final class InvalidDataException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the InvalidDataException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
