/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import Dto


public struct DiscoverTCPDevicesResponse: Serializable {
    public var result: [Dto.DeviceDiscoveryResult]

    public init(result: [Dto.DeviceDiscoveryResult] = []) {
        self.result = result
    }
}
