/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct StreamCancelOutputScheduleRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var pvt: Bool
    public var analog: Bool
    public var channelNumber: Int

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, pvt: Bool = false, analog: Bool = false, channelNumber: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.pvt = pvt
        self.analog = analog
        self.channelNumber = channelNumber
    }

    public static func fromByteArray(_ byteArray: Data) throws -> StreamCancelOutputScheduleRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(StreamCancelOutputScheduleRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "StreamCancelOutputScheduleRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "StreamCancelOutputScheduleRequest", error: error)
        }
    }
}
