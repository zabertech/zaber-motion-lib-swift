/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct TestResponseLong: Serializable {
    public var dataPong: [String]

    public init(dataPong: [String] = []) {
        self.dataPong = dataPong
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TestResponseLong {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TestResponseLong.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TestResponseLong", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TestResponseLong", error: error)
        }
    }
}
