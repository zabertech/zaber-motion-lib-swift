/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoGcode


public struct TranslatorCreateFromDeviceRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axes: [Int]
    public var config: DtoGcode.TranslatorConfig?

    public init(interfaceId: Int = 0, device: Int = 0, axes: [Int] = [], config: DtoGcode.TranslatorConfig? = nil) {
        self.interfaceId = interfaceId
        self.device = device
        self.axes = axes
        self.config = config
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TranslatorCreateFromDeviceRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TranslatorCreateFromDeviceRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TranslatorCreateFromDeviceRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TranslatorCreateFromDeviceRequest", error: error)
        }
    }
}
