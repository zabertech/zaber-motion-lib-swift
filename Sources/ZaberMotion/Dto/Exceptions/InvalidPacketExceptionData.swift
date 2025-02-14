/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
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

    public static func fromByteArray(_ byteArray: Data) throws -> InvalidPacketExceptionData {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(InvalidPacketExceptionData.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "InvalidPacketExceptionData", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "InvalidPacketExceptionData", error: error)
        }
    }
}
