/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import Dto


public struct DeviceIdentifyRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var assumeVersion: Dto.FirmwareVersion?

    public init(interfaceId: Int = 0, device: Int = 0, assumeVersion: Dto.FirmwareVersion? = nil) {
        self.interfaceId = interfaceId
        self.device = device
        self.assumeVersion = assumeVersion
    }
}
