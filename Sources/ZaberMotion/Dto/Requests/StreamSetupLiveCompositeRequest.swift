/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct StreamSetupLiveCompositeRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var pvt: Bool
    public var axes: [DtoAscii.StreamAxisDefinition]
    public var pvtAxes: [DtoAscii.PvtAxisDefinition]

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, pvt: Bool = false, axes: [DtoAscii.StreamAxisDefinition] = [], pvtAxes: [DtoAscii.PvtAxisDefinition] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.pvt = pvt
        self.axes = axes
        self.pvtAxes = pvtAxes
    }

    public static func fromByteArray(_ byteArray: Data) throws -> StreamSetupLiveCompositeRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(StreamSetupLiveCompositeRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "StreamSetupLiveCompositeRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "StreamSetupLiveCompositeRequest", error: error)
        }
    }
}
