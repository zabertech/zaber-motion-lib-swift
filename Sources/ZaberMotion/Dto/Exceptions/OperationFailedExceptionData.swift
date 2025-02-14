/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Contains additional data for OperationFailedException.
 */
public struct OperationFailedExceptionData: Serializable {

    /**
     * The full list of warnings.
     */
    public var warnings: [String]

    /**
     * The reason for the Exception.
     */
    public var reason: String

    /**
     * The address of the device that attempted the failed operation.
     */
    public var device: Int

    /**
     * The number of the axis that attempted the failed operation.
     */
    public var axis: Int

    public init(warnings: [String] = [], reason: String = "", device: Int = 0, axis: Int = 0) {
        self.warnings = warnings
        self.reason = reason
        self.device = device
        self.axis = axis
    }

    public static func fromByteArray(_ byteArray: Data) throws -> OperationFailedExceptionData {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(OperationFailedExceptionData.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "OperationFailedExceptionData", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "OperationFailedExceptionData", error: error)
        }
    }
}
