/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoGcode


public struct TranslatorCreateRequest: Serializable {
    public var definition: DtoGcode.DeviceDefinition
    public var config: DtoGcode.TranslatorConfig?

    public init(definition: DtoGcode.DeviceDefinition = DeviceDefinition(), config: DtoGcode.TranslatorConfig? = nil) {
        self.definition = definition
        self.config = config
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TranslatorCreateRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TranslatorCreateRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TranslatorCreateRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TranslatorCreateRequest", error: error)
        }
    }
}
