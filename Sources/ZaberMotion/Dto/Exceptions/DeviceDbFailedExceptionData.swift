/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Contains additional data for a DeviceDbFailedException.
 */
public struct DeviceDbFailedExceptionData: Serializable {

    /**
     * Code describing type of the error.
     */
    public var code: String

    public init(code: String = "") {
        self.code = code
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceDbFailedExceptionData {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceDbFailedExceptionData.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceDbFailedExceptionData", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceDbFailedExceptionData", error: error)
        }
    }
}
