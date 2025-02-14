/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoGcode


public struct TranslatorCreateLiveRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var config: DtoGcode.TranslatorConfig?

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, config: DtoGcode.TranslatorConfig? = nil) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.config = config
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TranslatorCreateLiveRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TranslatorCreateLiveRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TranslatorCreateLiveRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TranslatorCreateLiveRequest", error: error)
        }
    }
}
