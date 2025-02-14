/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct TestEvent: Serializable {
    public var data: String

    public init(data: String = "") {
        self.data = data
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TestEvent {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TestEvent.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TestEvent", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TestEvent", error: error)
        }
    }
}
