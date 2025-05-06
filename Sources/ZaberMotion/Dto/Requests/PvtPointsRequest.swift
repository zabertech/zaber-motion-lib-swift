/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct PvtPointsRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var pvt: Bool
    public var type: StreamSegmentType
    public var positions: [DtoAscii.MeasurementSequence]
    public var velocities: [DtoAscii.MeasurementSequence]
    public var times: DtoAscii.MeasurementSequence

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, pvt: Bool = false, type: StreamSegmentType = StreamSegmentType(rawValue: 0)!, positions: [DtoAscii.MeasurementSequence] = [], velocities: [DtoAscii.MeasurementSequence] = [], times: DtoAscii.MeasurementSequence = MeasurementSequence()) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.pvt = pvt
        self.type = type
        self.positions = positions
        self.velocities = velocities
        self.times = times
    }

    public static func fromByteArray(_ byteArray: Data) throws -> PvtPointsRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(PvtPointsRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "PvtPointsRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "PvtPointsRequest", error: error)
        }
    }
}
