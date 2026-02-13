/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Represents result of mDNS discovery for devices connected to network.
 */
public struct DeviceDiscoveryResult: Serializable {

    /**
     * Host name of the discoverd device.
     */
    public var hostname: String

    /**
     * IP address of the discoverd device.
     */
    public var address: String

    /**
     * Port number of the discovered device.
     */
    public var port: Int

    /**
     * Indicates if discovery result represents a single device or a device chain.
     */
    public var portType: DevicePortType

    /**
     * Device id of discovered device or head of discovered device chain.
     */
    public var deviceId: Int

    /**
     * Serial number of discovered device or head of discovered device chain.
     */
    public var serialNumber: Int

    public init(hostname: String = "", address: String = "", port: Int = 0, portType: DevicePortType = DevicePortType(rawValue: 0)!, deviceId: Int = 0, serialNumber: Int = 0) {
        self.hostname = hostname
        self.address = address
        self.port = port
        self.portType = portType
        self.deviceId = deviceId
        self.serialNumber = serialNumber
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceDiscoveryResult {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceDiscoveryResult.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceDiscoveryResult", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceDiscoveryResult", error: error)
        }
    }
}
