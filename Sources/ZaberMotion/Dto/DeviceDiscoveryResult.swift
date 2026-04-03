// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
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
}
