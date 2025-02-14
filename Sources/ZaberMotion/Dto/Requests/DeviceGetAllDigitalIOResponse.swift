/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DeviceGetAllDigitalIOResponse: Serializable {
    public var values: [Bool]

    public init(values: [Bool] = []) {
        self.values = values
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceGetAllDigitalIOResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceGetAllDigitalIOResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceGetAllDigitalIOResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceGetAllDigitalIOResponse", error: error)
        }
    }
}
