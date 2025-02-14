/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import Dto


public struct PvtPointRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var pvt: Bool
    public var type: StreamSegmentType
    public var positions: [Dto.Measurement]
    public var velocities: [Dto.Measurement?]
    public var time: Dto.Measurement

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, pvt: Bool = false, type: StreamSegmentType = StreamSegmentType(rawValue: 0)!, positions: [Dto.Measurement] = [], velocities: [Dto.Measurement?] = [], time: Dto.Measurement = Measurement()) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.pvt = pvt
        self.type = type
        self.positions = positions
        self.velocities = velocities
        self.time = time
    }

    public static func fromByteArray(_ byteArray: Data) throws -> PvtPointRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(PvtPointRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "PvtPointRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "PvtPointRequest", error: error)
        }
    }
}
