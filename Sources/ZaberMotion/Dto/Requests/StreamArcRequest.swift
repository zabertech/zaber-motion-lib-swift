/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import Dto


public struct StreamArcRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var pvt: Bool
    public var type: StreamSegmentType
    public var rotationDirection: Dto.RotationDirection
    public var centerX: Dto.Measurement
    public var centerY: Dto.Measurement
    public var endX: Dto.Measurement
    public var endY: Dto.Measurement
    public var targetAxesIndices: [Int]
    public var endpoint: [Dto.Measurement]

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, pvt: Bool = false, type: StreamSegmentType = StreamSegmentType(rawValue: 0)!, rotationDirection: Dto.RotationDirection = RotationDirection(rawValue: 0)!, centerX: Dto.Measurement = Measurement(), centerY: Dto.Measurement = Measurement(), endX: Dto.Measurement = Measurement(), endY: Dto.Measurement = Measurement(), targetAxesIndices: [Int] = [], endpoint: [Dto.Measurement] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.pvt = pvt
        self.type = type
        self.rotationDirection = rotationDirection
        self.centerX = centerX
        self.centerY = centerY
        self.endX = endX
        self.endY = endY
        self.targetAxesIndices = targetAxesIndices
        self.endpoint = endpoint
    }

    public static func fromByteArray(_ byteArray: Data) throws -> StreamArcRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(StreamArcRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "StreamArcRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "StreamArcRequest", error: error)
        }
    }
}
