/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Contains additional data for StreamMovementInterruptedException.
 */
public struct StreamMovementInterruptedExceptionData: Serializable {

    /**
     * The full list of warnings.
     */
    public var warnings: [String]

    /**
     * The reason for the Exception.
     */
    public var reason: String

    public init(warnings: [String] = [], reason: String = "") {
        self.warnings = warnings
        self.reason = reason
    }

    public static func fromByteArray(_ byteArray: Data) throws -> StreamMovementInterruptedExceptionData {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(StreamMovementInterruptedExceptionData.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "StreamMovementInterruptedExceptionData", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "StreamMovementInterruptedExceptionData", error: error)
        }
    }
}
