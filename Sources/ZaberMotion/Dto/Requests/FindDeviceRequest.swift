/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct FindDeviceRequest: Serializable {
    public var interfaceId: Int
    public var deviceAddress: Int

    public init(interfaceId: Int = 0, deviceAddress: Int = 0) {
        self.interfaceId = interfaceId
        self.deviceAddress = deviceAddress
    }
}
