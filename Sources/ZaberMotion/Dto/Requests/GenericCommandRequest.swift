/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct GenericCommandRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var command: String
    public var checkErrors: Bool
    public var timeout: Int

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, command: String = "", checkErrors: Bool = false, timeout: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.command = command
        self.checkErrors = checkErrors
        self.timeout = timeout
    }

    public static func fromByteArray(_ byteArray: Data) throws -> GenericCommandRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(GenericCommandRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "GenericCommandRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "GenericCommandRequest", error: error)
        }
    }
}
