/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct StreamGetMaxCentripetalAccelerationRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var pvt: Bool
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, pvt: Bool = false, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.pvt = pvt
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> StreamGetMaxCentripetalAccelerationRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(StreamGetMaxCentripetalAccelerationRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "StreamGetMaxCentripetalAccelerationRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "StreamGetMaxCentripetalAccelerationRequest", error: error)
        }
    }
}
