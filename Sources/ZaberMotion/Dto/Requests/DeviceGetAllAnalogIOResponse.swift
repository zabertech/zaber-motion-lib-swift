/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DeviceGetAllAnalogIOResponse: Serializable {
    public var values: [Double]

    public init(values: [Double] = []) {
        self.values = values
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceGetAllAnalogIOResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceGetAllAnalogIOResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceGetAllAnalogIOResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceGetAllAnalogIOResponse", error: error)
        }
    }
}
