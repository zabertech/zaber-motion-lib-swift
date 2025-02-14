/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct StreamSetupStoreArbitraryAxesRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var pvt: Bool
    public var streamBuffer: Int
    public var pvtBuffer: Int
    public var axesCount: Int

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, pvt: Bool = false, streamBuffer: Int = 0, pvtBuffer: Int = 0, axesCount: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.pvt = pvt
        self.streamBuffer = streamBuffer
        self.pvtBuffer = pvtBuffer
        self.axesCount = axesCount
    }

    public static func fromByteArray(_ byteArray: Data) throws -> StreamSetupStoreArbitraryAxesRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(StreamSetupStoreArbitraryAxesRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "StreamSetupStoreArbitraryAxesRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "StreamSetupStoreArbitraryAxesRequest", error: error)
        }
    }
}
