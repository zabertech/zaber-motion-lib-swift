/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct BinaryDeviceDetectRequest: Serializable {
    public var interfaceId: Int
    public var identifyDevices: Bool

    public init(interfaceId: Int = 0, identifyDevices: Bool = false) {
        self.interfaceId = interfaceId
        self.identifyDevices = identifyDevices
    }
}
