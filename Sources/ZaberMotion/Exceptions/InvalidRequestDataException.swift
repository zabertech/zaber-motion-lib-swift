// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Used for internal error handling.
 Indicates passing values of incorrect type from scripting languages or mixed library binary files.
 */
public final class InvalidRequestDataException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the InvalidRequestDataException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
