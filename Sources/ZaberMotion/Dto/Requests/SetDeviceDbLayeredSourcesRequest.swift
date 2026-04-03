// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import Dto


public struct SetDeviceDbLayeredSourcesRequest: Serializable {
    public var sources: [Dto.DeviceDbSource]

    public init(sources: [Dto.DeviceDbSource] = []) {
        self.sources = sources
    }
}
