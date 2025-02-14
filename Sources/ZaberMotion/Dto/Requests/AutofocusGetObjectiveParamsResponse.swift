/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import Dto


public struct AutofocusGetObjectiveParamsResponse: Serializable {
    public var parameters: [Dto.NamedParameter]

    public init(parameters: [Dto.NamedParameter] = []) {
        self.parameters = parameters
    }

    public static func fromByteArray(_ byteArray: Data) throws -> AutofocusGetObjectiveParamsResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(AutofocusGetObjectiveParamsResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "AutofocusGetObjectiveParamsResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "AutofocusGetObjectiveParamsResponse", error: error)
        }
    }
}
