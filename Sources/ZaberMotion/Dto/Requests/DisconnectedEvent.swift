/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Event that is sent when a connection is lost.
 */
public struct DisconnectedEvent: Serializable {

    /**
     * The id of the interface that was disconnected.
     */
    public var interfaceId: Int

    /**
     * The type of error that caused the disconnection.
     */
    public var errorType: Errors

    /**
     * The message describing the error.
     */
    public var errorMessage: String

    public init(interfaceId: Int = 0, errorType: Errors = Errors(rawValue: 0)!, errorMessage: String = "") {
        self.interfaceId = interfaceId
        self.errorType = errorType
        self.errorMessage = errorMessage
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DisconnectedEvent {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DisconnectedEvent.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DisconnectedEvent", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DisconnectedEvent", error: error)
        }
    }
}
