/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct FindDeviceResponse: Serializable {
    public var address: Int

    public init(address: Int = 0) {
        self.address = address
    }

    public static func fromByteArray(_ byteArray: Data) throws -> FindDeviceResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(FindDeviceResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "FindDeviceResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "FindDeviceResponse", error: error)
        }
    }
}
