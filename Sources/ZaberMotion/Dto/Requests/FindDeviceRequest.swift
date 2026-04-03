// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

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
