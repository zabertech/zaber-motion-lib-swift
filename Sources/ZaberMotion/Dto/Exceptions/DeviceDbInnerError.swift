/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * One of the errors that occurred while trying to access information from the device database.
 */
public struct DeviceDbInnerError: Serializable {

    /**
     * Code describing type of the error.
     */
    public var code: String

    /**
     * Description of the error.
     */
    public var message: String

    /**
     * A list of errors that occurred while trying to access information from the device database.
     */
    public var innerErrors: [DeviceDbInnerError]

    public init(code: String = "", message: String = "", innerErrors: [DeviceDbInnerError] = []) {
        self.code = code
        self.message = message
        self.innerErrors = innerErrors
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceDbInnerError {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceDbInnerError.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceDbInnerError", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceDbInnerError", error: error)
        }
    }
}
