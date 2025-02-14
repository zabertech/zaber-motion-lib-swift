/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct GetAllIoPortLabelsResponse: Serializable {
    public var labels: [DtoAscii.IoPortLabel]

    public init(labels: [DtoAscii.IoPortLabel] = []) {
        self.labels = labels
    }

    public static func fromByteArray(_ byteArray: Data) throws -> GetAllIoPortLabelsResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(GetAllIoPortLabelsResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "GetAllIoPortLabelsResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "GetAllIoPortLabelsResponse", error: error)
        }
    }
}
