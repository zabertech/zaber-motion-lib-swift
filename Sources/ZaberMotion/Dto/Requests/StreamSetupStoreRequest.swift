/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct StreamSetupStoreRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var pvt: Bool
    public var streamBuffer: Int
    public var pvtBuffer: Int
    public var axes: [Int]

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, pvt: Bool = false, streamBuffer: Int = 0, pvtBuffer: Int = 0, axes: [Int] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.pvt = pvt
        self.streamBuffer = streamBuffer
        self.pvtBuffer = pvtBuffer
        self.axes = axes
    }

    public static func fromByteArray(_ byteArray: Data) throws -> StreamSetupStoreRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(StreamSetupStoreRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "StreamSetupStoreRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "StreamSetupStoreRequest", error: error)
        }
    }
}
