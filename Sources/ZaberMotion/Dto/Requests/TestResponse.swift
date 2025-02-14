/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct TestResponse: Serializable {
    public var dataPong: String

    public init(dataPong: String = "") {
        self.dataPong = dataPong
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TestResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TestResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TestResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TestResponse", error: error)
        }
    }
}
