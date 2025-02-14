/**
 Error propagated from the native library.
 */
public class MotionLibException: Error, @unchecked Sendable {
    public let message: String

    /**
     Initializes a new instance of the MotionLibException class.

     - Parameters:
        - message: Message from the native library.
     */
    init(message: String) {
        self.message = message
    }

    public func toString() -> String {
        return "\(self): \(message)"
    }
}
