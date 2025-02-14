/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DeviceCancelAllOutputsScheduleRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var analog: Bool
    public var channels: [Bool]

    public init(interfaceId: Int = 0, device: Int = 0, analog: Bool = false, channels: [Bool] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.analog = analog
        self.channels = channels
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceCancelAllOutputsScheduleRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceCancelAllOutputsScheduleRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceCancelAllOutputsScheduleRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceCancelAllOutputsScheduleRequest", error: error)
        }
    }
}
