/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * An object containing any setup issues that will prevent setting a state to a given device.
 */
public struct CanSetStateDeviceResponse: Serializable {

    /**
     * The error blocking applying this state to the given device.
     */
    public var error: String?

    /**
     * A list of errors that block setting state of device's axes.
     */
    public var axisErrors: [CanSetStateAxisResponse]

    public init(error: String? = nil, axisErrors: [CanSetStateAxisResponse] = []) {
        self.error = error
        self.axisErrors = axisErrors
    }

    public static func fromByteArray(_ byteArray: Data) throws -> CanSetStateDeviceResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(CanSetStateDeviceResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "CanSetStateDeviceResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "CanSetStateDeviceResponse", error: error)
        }
    }
}
