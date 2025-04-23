// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when attempting an operation that requires an identified device.
 */
public final class DeviceNotIdentifiedException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the DeviceNotIdentifiedException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
