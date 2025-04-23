// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when a command is rejected because the device is in EtherCAT Control (remote) mode.
 Change the device setting comm.ethercat.remote to 0 to switch to local control.
 */
public final class RemoteModeException: CommandFailedException, @unchecked Sendable {

    /**
     Initializes a new instance of the RemoteModeException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Raw unparsed custom data from the native library for the exception.
     */
    public override init(message: String, customData: Data) throws {
        try super.init(message: message, customData: customData)
    }

    /**
     Initializes a new instance of the RemoteModeException class.

     - Parameters:
        - message: Message from the native library.
        - customData: Additional data about the exception.
     */
    public override init(message: String, customData: CommandFailedExceptionData) {
        super.init(message: message, customData: customData)
    }
}
