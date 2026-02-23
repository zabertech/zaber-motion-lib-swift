/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoAscii


public struct DeviceSetAllDigitalOutputsRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var values: [DtoAscii.DigitalOutputAction]

    public init(interfaceId: Int = 0, device: Int = 0, values: [DtoAscii.DigitalOutputAction] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.values = values
    }
}
