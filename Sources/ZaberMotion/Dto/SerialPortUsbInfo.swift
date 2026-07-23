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

    public init(vendorId: Int = 0, productId: Int = 0) {
        self.vendorId = vendorId
        self.productId = productId
    }
}
