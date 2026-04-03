// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Information describing why the command could not fit.
 */
public struct CommandTooLongExceptionData: Serializable {

    /**
     * The part of the command that could be successfully fit in the space provided by the protocol.
     */
    public var fit: String

    /**
     * The part of the command that could not fit within the space provided.
     */
    public var remainder: String

    /**
     * The length of the ascii string that can be written to a single line.
     */
    public var packetSize: Int

    /**
     * The number of lines a command can be split over using continuations.
     */
    public var packetsMax: Int

    public init(fit: String = "", remainder: String = "", packetSize: Int = 0, packetsMax: Int = 0) {
        self.fit = fit
        self.remainder = remainder
        self.packetSize = packetSize
        self.packetsMax = packetsMax
    }
}
