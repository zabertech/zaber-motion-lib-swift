// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Holds the USB identifiers of a device connected to a serial port.
 */
public struct SerialPortUsbInfo: Serializable {

    /**
     * USB vendor identifier (VID) of the device.
     */
    public var vendorId: Int

    /**
     * USB product identifier (PID) of the device.
     */
    public var productId: Int

    /**
     * Latency timer of the port in milliseconds.
     * Only available for FTDI-based devices such as the Zaber X-USBDC.
     * Only available on Windows and Linux.
     */
    public var latencyTimer: Int?

    public init(vendorId: Int = 0, productId: Int = 0, latencyTimer: Int? = nil) {
        self.vendorId = vendorId
        self.productId = productId
        self.latencyTimer = latencyTimer
    }
}
