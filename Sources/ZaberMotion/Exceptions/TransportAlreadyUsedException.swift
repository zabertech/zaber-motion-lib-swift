// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when a transport has already been used to open another connection.
 */
public final class TransportAlreadyUsedException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the TransportAlreadyUsedException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
