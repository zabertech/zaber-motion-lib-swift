/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DeviceCancelOutputScheduleRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var analog: Bool
    public var channelNumber: Int

    public init(interfaceId: Int = 0, device: Int = 0, analog: Bool = false, channelNumber: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.analog = analog
        self.channelNumber = channelNumber
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceCancelOutputScheduleRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceCancelOutputScheduleRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceCancelOutputScheduleRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceCancelOutputScheduleRequest", error: error)
        }
    }
}
