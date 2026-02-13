/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import Dto


/**
 * Definition of a mock device.
 */
public struct MockDevice: Serializable {

    /**
     * A valid Zaber device ID.
     */
    public var deviceId: Int

    /**
     * Version of the firmware. Defaults to device database latest. To omit minor or build version, set them to -1.
     */
    public var firmwareVersion: Dto.FirmwareVersion?

    /**
     * The device has hardware modifications. Defaults to false.
     */
    public var isModified: Bool?

    /**
     * The number of microsteps per full step for integrated devices. Defaults to device database default.
     */
    public var resolution: Int?

    /**
     * List of mock peripherals connected to the device.
     */
    public var peripherals: [MockPeripheral]?

    public init(deviceId: Int = 0, firmwareVersion: Dto.FirmwareVersion? = nil, isModified: Bool? = nil, resolution: Int? = nil, peripherals: [MockPeripheral]? = nil) {
        self.deviceId = deviceId
        self.firmwareVersion = firmwareVersion
        self.isModified = isModified
        self.resolution = resolution
        self.peripherals = peripherals
    }

    public static func fromByteArray(_ byteArray: Data) throws -> MockDevice {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(MockDevice.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "MockDevice", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "MockDevice", error: error)
        }
    }
}
