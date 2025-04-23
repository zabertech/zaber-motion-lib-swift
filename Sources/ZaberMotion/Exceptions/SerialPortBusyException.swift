// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when a serial port cannot be opened because it is in use by another application.
 */
public final class SerialPortBusyException: ConnectionFailedException, @unchecked Sendable {

    /**
     Initializes a new instance of the SerialPortBusyException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
