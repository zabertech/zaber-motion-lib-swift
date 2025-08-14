/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import Dto


public struct SetDeviceDbLayeredSourcesRequest: Serializable {
    public var sources: [Dto.DeviceDbSource]

    public init(sources: [Dto.DeviceDbSource] = []) {
        self.sources = sources
    }

    public static func fromByteArray(_ byteArray: Data) throws -> SetDeviceDbLayeredSourcesRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(SetDeviceDbLayeredSourcesRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "SetDeviceDbLayeredSourcesRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "SetDeviceDbLayeredSourcesRequest", error: error)
        }
    }
}
