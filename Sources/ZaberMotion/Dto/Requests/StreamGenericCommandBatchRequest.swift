/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct StreamGenericCommandBatchRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var pvt: Bool
    public var batch: [String]

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, pvt: Bool = false, batch: [String] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.pvt = pvt
        self.batch = batch
    }

    public static func fromByteArray(_ byteArray: Data) throws -> StreamGenericCommandBatchRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(StreamGenericCommandBatchRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "StreamGenericCommandBatchRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "StreamGenericCommandBatchRequest", error: error)
        }
    }
}
