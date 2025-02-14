// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Thrown when the loaded shared library is incompatible with the running code.
 Typically caused by mixed library binary files. Reinstall the library.
 */
public final class IncompatibleSharedLibraryException: MotionLibException, @unchecked Sendable {

    /**
     Initializes a new instance of the IncompatibleSharedLibraryException class.

     - Parameters:
        - message: Message from the native library.
     */
    public override init(message: String) {
        super.init(message: message)
    }
}
