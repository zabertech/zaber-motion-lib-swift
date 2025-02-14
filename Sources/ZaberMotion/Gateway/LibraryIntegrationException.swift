import ZaberMotionExceptions

/**
 Thrown if there is a mismatch between expected data and what we actually receive from the native library.
 */
public final class LibraryIntegrationException: Error, Sendable {
    let message: String

    /**
     Initializes a new instance of the LibraryIntegrationException class.

     - Parameters:
        - message: Message from the native library.
     */
    public init(message: String) {
        self.message = message
    }
}
