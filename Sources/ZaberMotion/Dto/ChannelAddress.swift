/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Holds device address and IO channel number.
 */
public struct ChannelAddress: Serializable {

    /**
     * Device address.
     */
    public var device: Int

    /**
     * IO channel number.
     */
    public var channel: Int

    public init(device: Int = 0, channel: Int = 0) {
        self.device = device
        self.channel = channel
    }

    public static func fromByteArray(_ byteArray: Data) throws -> ChannelAddress {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(ChannelAddress.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "ChannelAddress", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "ChannelAddress", error: error)
        }
    }
}
