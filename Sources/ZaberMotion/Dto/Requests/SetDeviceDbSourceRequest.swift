/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import Dto


public struct SetDeviceDbSourceRequest: Serializable {
    public var sourceType: Dto.DeviceDbSourceType
    public var urlOrFilePath: String?

    public init(sourceType: Dto.DeviceDbSourceType = DeviceDbSourceType(rawValue: 0)!, urlOrFilePath: String? = nil) {
        self.sourceType = sourceType
        self.urlOrFilePath = urlOrFilePath
    }

    public static func fromByteArray(_ byteArray: Data) throws -> SetDeviceDbSourceRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(SetDeviceDbSourceRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "SetDeviceDbSourceRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "SetDeviceDbSourceRequest", error: error)
        }
    }
}
