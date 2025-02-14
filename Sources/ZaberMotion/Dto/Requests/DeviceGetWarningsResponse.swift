/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DeviceGetWarningsResponse: Serializable {
    public var flags: [String]

    public init(flags: [String] = []) {
        self.flags = flags
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceGetWarningsResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceGetWarningsResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceGetWarningsResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceGetWarningsResponse", error: error)
        }
    }
}
