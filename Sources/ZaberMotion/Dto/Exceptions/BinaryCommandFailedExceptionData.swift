/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Contains additional data for BinaryCommandFailedException.
 */
public struct BinaryCommandFailedExceptionData: Serializable {

    /**
     * The response data.
     */
    public var responseData: Int

    public init(responseData: Int = 0) {
        self.responseData = responseData
    }

    public static func fromByteArray(_ byteArray: Data) throws -> BinaryCommandFailedExceptionData {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(BinaryCommandFailedExceptionData.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "BinaryCommandFailedExceptionData", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "BinaryCommandFailedExceptionData", error: error)
        }
    }
}
