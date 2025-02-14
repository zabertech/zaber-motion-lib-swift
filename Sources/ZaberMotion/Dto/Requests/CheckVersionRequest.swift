/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct CheckVersionRequest: Serializable {
    public var version: String
    public var host: String

    public init(version: String = "", host: String = "") {
        self.version = version
        self.host = host
    }

    public static func fromByteArray(_ byteArray: Data) throws -> CheckVersionRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(CheckVersionRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "CheckVersionRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "CheckVersionRequest", error: error)
        }
    }
}
