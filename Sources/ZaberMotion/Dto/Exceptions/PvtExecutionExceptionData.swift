/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Contains additional data for PvtExecutionException.
 */
public struct PvtExecutionExceptionData: Serializable {

    /**
     * The error flag that caused the exception.
     */
    public var errorFlag: String

    /**
     * The reason for the exception.
     */
    public var reason: String

    /**
     * A list of points that cause the error (if applicable).
     */
    public var invalidPoints: [InvalidPvtPoint]

    public init(errorFlag: String = "", reason: String = "", invalidPoints: [InvalidPvtPoint] = []) {
        self.errorFlag = errorFlag
        self.reason = reason
        self.invalidPoints = invalidPoints
    }

    public static func fromByteArray(_ byteArray: Data) throws -> PvtExecutionExceptionData {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(PvtExecutionExceptionData.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "PvtExecutionExceptionData", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "PvtExecutionExceptionData", error: error)
        }
    }
}
