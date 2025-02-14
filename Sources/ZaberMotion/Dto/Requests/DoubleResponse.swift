/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct DoubleResponse: Serializable {
    public var value: Double

    public init(value: Double = 0.0) {
        self.value = value
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DoubleResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DoubleResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DoubleResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DoubleResponse", error: error)
        }
    }
}
