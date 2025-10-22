/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct TestRequestComplex: Serializable {
    public var intArray: [Int]

    public init(intArray: [Int] = []) {
        self.intArray = intArray
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TestRequestComplex {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TestRequestComplex.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TestRequestComplex", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TestRequestComplex", error: error)
        }
    }
}
