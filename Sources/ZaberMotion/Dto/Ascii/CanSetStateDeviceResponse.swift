/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * An object containing any setup issues that will prevent setting a state to a given device.
 */
public struct CanSetStateDeviceResponse: Serializable {

    /**
     * The error blocking applying this state to the given device, or null if there is no error.
     */
    public var error: String?

    /**
     * A list of axis responses, potentially with messages for errors
     * which would block setting the state of the device's axes.
     */
    public var axisResponses: [CanSetStateAxisResponse]

    public init(error: String? = nil, axisResponses: [CanSetStateAxisResponse] = []) {
        self.error = error
        self.axisResponses = axisResponses
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
