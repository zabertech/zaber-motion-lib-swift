// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when a device does not support a requested command or setting.
 */
public final class NotSupportedException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the NotSupportedException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
