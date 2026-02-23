#if canImport(Darwin)
import Darwin
#elseif canImport(Glibc)
@preconcurrency import Glibc
#endif

#if os(Windows)
import Foundation
#endif

public func printToStderr(_ message: String) {
    #if os(Windows)
    FileHandle.standardError.write((message + "\n").data(using: .utf8)!)
    #else
    fputs(message + "\n", stderr)
    #endif
}
