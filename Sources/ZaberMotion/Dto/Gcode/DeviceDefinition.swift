/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import Dto


/**
 * Holds information about device and its axes for purpose of a translator.
 */
public struct DeviceDefinition: Serializable {

    /**
     * Device ID of the controller.
     * Can be obtained from device settings.
     */
    public var deviceId: Int

    /**
     * Applicable axes of the device.
     */
    public var axes: [AxisDefinition]

    /**
     * The smallest of each axis' maxspeed setting value.
     * This value becomes the traverse rate of the translator.
     */
    public var maxSpeed: Dto.Measurement

    public init(deviceId: Int = 0, axes: [AxisDefinition] = [], maxSpeed: Dto.Measurement = Measurement()) {
        self.deviceId = deviceId
        self.axes = axes
        self.maxSpeed = maxSpeed
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceDefinition {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceDefinition.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceDefinition", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceDefinition", error: error)
        }
    }
}
