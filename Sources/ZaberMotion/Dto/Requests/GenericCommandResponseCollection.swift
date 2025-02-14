/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct GenericCommandResponseCollection: Serializable {
    public var responses: [DtoAscii.Response]

    public init(responses: [DtoAscii.Response] = []) {
        self.responses = responses
    }

    public static func fromByteArray(_ byteArray: Data) throws -> GenericCommandResponseCollection {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(GenericCommandResponseCollection.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "GenericCommandResponseCollection", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "GenericCommandResponseCollection", error: error)
        }
    }
}
