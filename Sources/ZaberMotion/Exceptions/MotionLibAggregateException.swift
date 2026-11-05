// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation

/**
 Module: ZaberMotionExceptions

 Thrown when multiple exceptions are bundled together.
 */
public final class MotionLibAggregateException: MotionLibException, @unchecked Sendable {

    /**
     The list of exceptions bundled in this aggregate exception.
     */
    public let exceptions: [MotionLibException]

    /**
     Initializes a new instance of the MotionLibAggregateException class.

     - Parameters:
        - message: Message from the native library.
        - exceptions: The list of exceptions bundled in this aggregate exception.
     */
    public init(message: String, exceptions: [MotionLibException]) {
        self.exceptions = exceptions
        super.init(message: message)
    }
}
