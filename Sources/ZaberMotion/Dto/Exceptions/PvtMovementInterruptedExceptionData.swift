/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Contains additional data for PvtMovementInterruptedException.
 */
public struct PvtMovementInterruptedExceptionData: Serializable {

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

    public static func fromByteArray(_ byteArray: Data) throws -> PvtMovementInterruptedExceptionData {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(PvtMovementInterruptedExceptionData.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "PvtMovementInterruptedExceptionData", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "PvtMovementInterruptedExceptionData", error: error)
        }
    }
}
