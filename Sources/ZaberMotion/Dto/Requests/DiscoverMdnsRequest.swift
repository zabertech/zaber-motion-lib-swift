/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DiscoverMdnsRequest: Serializable {
    public var duration: Int
    public var interfaceIpAddress: String?

    public init(duration: Int = 0, interfaceIpAddress: String? = nil) {
        self.duration = duration
        self.interfaceIpAddress = interfaceIpAddress
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DiscoverMdnsRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DiscoverMdnsRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DiscoverMdnsRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DiscoverMdnsRequest", error: error)
        }
    }
}
