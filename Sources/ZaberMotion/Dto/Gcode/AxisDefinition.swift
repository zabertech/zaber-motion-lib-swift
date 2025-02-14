/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Defines an axis of the translator.
 */
public struct AxisDefinition: Serializable {

    /**
     * ID of the peripheral.
     */
    public var peripheralId: Int

    /**
     * Microstep resolution of the axis.
     * Can be obtained by reading the resolution setting.
     * Leave empty if the axis does not have the setting.
     */
    public var microstepResolution: Int?

    public init(peripheralId: Int = 0, microstepResolution: Int? = nil) {
        self.peripheralId = peripheralId
        self.microstepResolution = microstepResolution
    }

    public static func fromByteArray(_ byteArray: Data) throws -> AxisDefinition {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(AxisDefinition.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "AxisDefinition", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "AxisDefinition", error: error)
        }
    }
}
