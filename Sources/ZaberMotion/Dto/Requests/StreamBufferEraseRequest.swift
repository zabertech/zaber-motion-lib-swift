/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct StreamBufferEraseRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var bufferId: Int
    public var pvt: Bool

    public init(interfaceId: Int = 0, device: Int = 0, bufferId: Int = 0, pvt: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.bufferId = bufferId
        self.pvt = pvt
    }

    public static func fromByteArray(_ byteArray: Data) throws -> StreamBufferEraseRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(StreamBufferEraseRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "StreamBufferEraseRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "StreamBufferEraseRequest", error: error)
        }
    }
}
