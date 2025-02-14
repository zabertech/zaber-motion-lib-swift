/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct StreamEmptyRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var pvt: Bool

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, pvt: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.pvt = pvt
    }

    public static func fromByteArray(_ byteArray: Data) throws -> StreamEmptyRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(StreamEmptyRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "StreamEmptyRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "StreamEmptyRequest", error: error)
        }
    }
}
