// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Used for internal error handling. Indicates mixed library binary files. Reinstall the library.
 */
public final class UnknownRequestException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the UnknownRequestException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
