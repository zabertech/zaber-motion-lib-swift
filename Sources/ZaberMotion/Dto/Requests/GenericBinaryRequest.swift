/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoBinary


public struct GenericBinaryRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var command: DtoBinary.CommandCode
    public var data: Int
    public var checkErrors: Bool
    public var timeout: Double

    public init(interfaceId: Int = 0, device: Int = 0, command: DtoBinary.CommandCode = CommandCode(rawValue: 0)!, data: Int = 0, checkErrors: Bool = false, timeout: Double = 0.0) {
        self.interfaceId = interfaceId
        self.device = device
        self.command = command
        self.data = data
        self.checkErrors = checkErrors
        self.timeout = timeout
    }

    public static func fromByteArray(_ byteArray: Data) throws -> GenericBinaryRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(GenericBinaryRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "GenericBinaryRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "GenericBinaryRequest", error: error)
        }
    }
}
