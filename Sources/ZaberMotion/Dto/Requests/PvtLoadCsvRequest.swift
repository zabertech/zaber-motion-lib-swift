/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct PvtLoadCsvRequest: Serializable {
    public var path: String

    public init(path: String = "") {
        self.path = path
    }

    public static func fromByteArray(_ byteArray: Data) throws -> PvtLoadCsvRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(PvtLoadCsvRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "PvtLoadCsvRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "PvtLoadCsvRequest", error: error)
        }
    }
}
