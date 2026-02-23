/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct DeviceDetectRequest: Serializable {
    public var interfaceId: Int
    public var identifyDevices: Bool
    public var type: DeviceType

    public init(interfaceId: Int = 0, identifyDevices: Bool = false, type: DeviceType = DeviceType(rawValue: 0)!) {
        self.interfaceId = interfaceId
        self.identifyDevices = identifyDevices
        self.type = type
    }
}
