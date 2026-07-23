// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Holds details of a serial port on the computer.
 */
public struct SerialPortDetails: Serializable {

    /**
     * Name of the serial port (e.g. COM3 on Windows, /dev/ttyUSB0 on Linux).
     */
    public var name: String

    /**
     * USB identifiers of the device connected to the port, or null if it is not a USB device.
     */
    public var usbInfo: SerialPortUsbInfo?

    public init(name: String = "", usbInfo: SerialPortUsbInfo? = nil) {
        self.name = name
        self.usbInfo = usbInfo
    }
}
