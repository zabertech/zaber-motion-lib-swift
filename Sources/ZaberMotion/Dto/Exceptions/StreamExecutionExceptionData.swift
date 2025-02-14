/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Contains additional data for StreamExecutionException.
 */
public struct StreamExecutionExceptionData: Serializable {

    /**
     * The error flag that caused the exception.
     */
    public var errorFlag: String

    /**
     * The reason for the exception.
     */
    public var reason: String

    public init(errorFlag: String = "", reason: String = "") {
        self.errorFlag = errorFlag
        self.reason = reason
    }

    public static func fromByteArray(_ byteArray: Data) throws -> StreamExecutionExceptionData {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(StreamExecutionExceptionData.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "StreamExecutionExceptionData", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "StreamExecutionExceptionData", error: error)
        }
    }
}
