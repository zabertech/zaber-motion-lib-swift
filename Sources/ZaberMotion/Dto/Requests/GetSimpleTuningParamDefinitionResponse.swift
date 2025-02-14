/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct GetSimpleTuningParamDefinitionResponse: Serializable {
    public var params: [DtoAscii.SimpleTuningParamDefinition]

    public init(params: [DtoAscii.SimpleTuningParamDefinition] = []) {
        self.params = params
    }

    public static func fromByteArray(_ byteArray: Data) throws -> GetSimpleTuningParamDefinitionResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(GetSimpleTuningParamDefinitionResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "GetSimpleTuningParamDefinitionResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "GetSimpleTuningParamDefinitionResponse", error: error)
        }
    }
}
