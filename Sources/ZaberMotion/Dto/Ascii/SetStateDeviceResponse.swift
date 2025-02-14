/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * An object containing any non-blocking issues encountered when loading a saved state to a device.
 */
public struct SetStateDeviceResponse: Serializable {

    /**
     * The warnings encountered when applying this state to the given device.
     */
    public var warnings: [String]

    /**
     * A list of warnings encountered when applying this state to the device's axes.
     */
    public var axisResponses: [SetStateAxisResponse]

    public init(warnings: [String] = [], axisResponses: [SetStateAxisResponse] = []) {
        self.warnings = warnings
        self.axisResponses = axisResponses
    }

    public static func fromByteArray(_ byteArray: Data) throws -> SetStateDeviceResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(SetStateDeviceResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "SetStateDeviceResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "SetStateDeviceResponse", error: error)
        }
    }
}
