/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct DeviceEmptyRequest: Serializable {
    public var interfaceId: Int
    public var device: Int

    public init(interfaceId: Int = 0, device: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
    }
}
