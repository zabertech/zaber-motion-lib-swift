/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct ChannelOn: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var on: Bool

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, on: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.on = on
    }

    public static func fromByteArray(_ byteArray: Data) throws -> ChannelOn {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(ChannelOn.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "ChannelOn", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "ChannelOn", error: error)
        }
    }
}
