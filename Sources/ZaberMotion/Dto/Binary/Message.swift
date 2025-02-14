/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * A message in the Binary protocol.
 */
public struct Message: Serializable {

    /**
     * Number of the device that sent or should receive the message.
     */
    public var deviceAddress: Int

    /**
     * The warning flag contains the highest priority warning currently active for the device or axis.
     */
    public var command: Int

    /**
     * Data payload of the message, if applicable, or zero otherwise.
     */
    public var data: Int

    public init(deviceAddress: Int = 0, command: Int = 0, data: Int = 0) {
        self.deviceAddress = deviceAddress
        self.command = command
        self.data = data
    }

    public static func fromByteArray(_ byteArray: Data) throws -> Message {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(Message.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "Message", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "Message", error: error)
        }
    }
}
