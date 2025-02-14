/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct CanSetStateAxisResponse: Serializable {
    public var error: String?
    public var axisNumber: Int

    public init(error: String? = nil, axisNumber: Int = 0) {
        self.error = error
        self.axisNumber = axisNumber
    }

    public static func fromByteArray(_ byteArray: Data) throws -> CanSetStateAxisResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(CanSetStateAxisResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "CanSetStateAxisResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "CanSetStateAxisResponse", error: error)
        }
    }
}
