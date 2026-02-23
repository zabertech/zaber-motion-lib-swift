/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

/**
 * Contains additional data for the InvalidPacketException.
 */
public struct InvalidPacketExceptionData: Serializable {

    /**
     * The invalid packet that caused the exception.
     */
    public var packet: String

    /**
     * The reason for the exception.
     */
    public var reason: String

    public init(packet: String = "", reason: String = "") {
        self.packet = packet
        self.reason = reason
    }
}
