/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Contains additional data for InvalidResponseException.
 */
public struct InvalidResponseExceptionData: Serializable {

    /**
     * The response data.
     */
    public var response: String

    public init(response: String = "") {
        self.response = response
    }

    public static func fromByteArray(_ byteArray: Data) throws -> InvalidResponseExceptionData {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(InvalidResponseExceptionData.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "InvalidResponseExceptionData", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "InvalidResponseExceptionData", error: error)
        }
    }
}
