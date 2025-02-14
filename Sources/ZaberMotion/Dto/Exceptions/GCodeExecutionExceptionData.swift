/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Contains additional data for GCodeExecutionException.
 */
public struct GCodeExecutionExceptionData: Serializable {

    /**
     * The index in the block string that caused the exception.
     */
    public var fromBlock: Int

    /**
     * The end index in the block string that caused the exception.
     * The end index is exclusive.
     */
    public var toBlock: Int

    public init(fromBlock: Int = 0, toBlock: Int = 0) {
        self.fromBlock = fromBlock
        self.toBlock = toBlock
    }

    public static func fromByteArray(_ byteArray: Data) throws -> GCodeExecutionExceptionData {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(GCodeExecutionExceptionData.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "GCodeExecutionExceptionData", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "GCodeExecutionExceptionData", error: error)
        }
    }
}
