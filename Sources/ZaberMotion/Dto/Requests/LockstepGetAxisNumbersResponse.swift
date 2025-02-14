/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct LockstepGetAxisNumbersResponse: Serializable {
    public var axes: [Int]

    public init(axes: [Int] = []) {
        self.axes = axes
    }

    public static func fromByteArray(_ byteArray: Data) throws -> LockstepGetAxisNumbersResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(LockstepGetAxisNumbersResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "LockstepGetAxisNumbersResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "LockstepGetAxisNumbersResponse", error: error)
        }
    }
}
