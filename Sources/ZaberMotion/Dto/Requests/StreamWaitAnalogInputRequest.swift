/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct StreamWaitAnalogInputRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var pvt: Bool
    public var channelNumber: Int
    public var condition: String
    public var value: Double

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, pvt: Bool = false, channelNumber: Int = 0, condition: String = "", value: Double = 0.0) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.pvt = pvt
        self.channelNumber = channelNumber
        self.condition = condition
        self.value = value
    }

    public static func fromByteArray(_ byteArray: Data) throws -> StreamWaitAnalogInputRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(StreamWaitAnalogInputRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "StreamWaitAnalogInputRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "StreamWaitAnalogInputRequest", error: error)
        }
    }
}
