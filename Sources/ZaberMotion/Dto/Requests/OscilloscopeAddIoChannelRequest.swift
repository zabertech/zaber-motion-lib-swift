/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct OscilloscopeAddIoChannelRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var ioType: DtoAscii.IoPortType
    public var ioChannel: Int

    public init(interfaceId: Int = 0, device: Int = 0, ioType: DtoAscii.IoPortType = IoPortType(rawValue: 0)!, ioChannel: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.ioType = ioType
        self.ioChannel = ioChannel
    }

    public static func fromByteArray(_ byteArray: Data) throws -> OscilloscopeAddIoChannelRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(OscilloscopeAddIoChannelRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "OscilloscopeAddIoChannelRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "OscilloscopeAddIoChannelRequest", error: error)
        }
    }
}
