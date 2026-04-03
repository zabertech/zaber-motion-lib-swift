// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import Dto


public struct DiscoverTCPDevicesResponse: Serializable {
    public var result: [Dto.DeviceDiscoveryResult]

    public init(result: [Dto.DeviceDiscoveryResult] = []) {
        self.result = result
    }
}
