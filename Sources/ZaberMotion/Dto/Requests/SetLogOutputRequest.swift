/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import Dto


public struct SetLogOutputRequest: Serializable {
    public var mode: Dto.LogOutputMode
    public var filePath: String?

    public init(mode: Dto.LogOutputMode = LogOutputMode(rawValue: 0)!, filePath: String? = nil) {
        self.mode = mode
        self.filePath = filePath
    }

    public static func fromByteArray(_ byteArray: Data) throws -> SetLogOutputRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(SetLogOutputRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "SetLogOutputRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "SetLogOutputRequest", error: error)
        }
    }
}
