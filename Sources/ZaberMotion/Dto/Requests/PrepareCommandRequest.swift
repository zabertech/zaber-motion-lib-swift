/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import Dto


public struct PrepareCommandRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var commandTemplate: String
    public var parameters: [Dto.Measurement]

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, commandTemplate: String = "", parameters: [Dto.Measurement] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.commandTemplate = commandTemplate
        self.parameters = parameters
    }

    public static func fromByteArray(_ byteArray: Data) throws -> PrepareCommandRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(PrepareCommandRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "PrepareCommandRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "PrepareCommandRequest", error: error)
        }
    }
}
