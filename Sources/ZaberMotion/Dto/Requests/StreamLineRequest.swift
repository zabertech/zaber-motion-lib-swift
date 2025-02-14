/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import Dto


public struct StreamLineRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var pvt: Bool
    public var type: StreamSegmentType
    public var endpoint: [Dto.Measurement]
    public var targetAxesIndices: [Int]

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, pvt: Bool = false, type: StreamSegmentType = StreamSegmentType(rawValue: 0)!, endpoint: [Dto.Measurement] = [], targetAxesIndices: [Int] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.pvt = pvt
        self.type = type
        self.endpoint = endpoint
        self.targetAxesIndices = targetAxesIndices
    }

    public static func fromByteArray(_ byteArray: Data) throws -> StreamLineRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(StreamLineRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "StreamLineRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "StreamLineRequest", error: error)
        }
    }
}
