/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct TestRequest: Serializable {
    public var returnError: Bool
    public var dataPing: String
    public var returnErrorWithData: Bool

    public init(returnError: Bool = false, dataPing: String = "", returnErrorWithData: Bool = false) {
        self.returnError = returnError
        self.dataPing = dataPing
        self.returnErrorWithData = returnErrorWithData
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TestRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TestRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TestRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TestRequest", error: error)
        }
    }
}
