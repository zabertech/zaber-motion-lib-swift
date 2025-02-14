/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct StreamSetAllDigitalOutputsRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var pvt: Bool
    public var values: [DtoAscii.DigitalOutputAction]

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, pvt: Bool = false, values: [DtoAscii.DigitalOutputAction] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.pvt = pvt
        self.values = values
    }

    public static func fromByteArray(_ byteArray: Data) throws -> StreamSetAllDigitalOutputsRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(StreamSetAllDigitalOutputsRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "StreamSetAllDigitalOutputsRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "StreamSetAllDigitalOutputsRequest", error: error)
        }
    }
}
