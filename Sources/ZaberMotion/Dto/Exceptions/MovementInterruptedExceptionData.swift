/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Contains additional data for MovementInterruptedException.
 */
public struct MovementInterruptedExceptionData: Serializable {

    /**
     * The full list of warnings.
     */
    public var warnings: [String]

    /**
     * The reason for the Exception.
     */
    public var reason: String

    /**
     * The address of the device that caused the interruption.
     */
    public var device: Int

    /**
     * The number of the axis that caused the interruption.
     */
    public var axis: Int

    public init(warnings: [String] = [], reason: String = "", device: Int = 0, axis: Int = 0) {
        self.warnings = warnings
        self.reason = reason
        self.device = device
        self.axis = axis
    }

    public static func fromByteArray(_ byteArray: Data) throws -> MovementInterruptedExceptionData {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(MovementInterruptedExceptionData.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "MovementInterruptedExceptionData", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "MovementInterruptedExceptionData", error: error)
        }
    }
}
