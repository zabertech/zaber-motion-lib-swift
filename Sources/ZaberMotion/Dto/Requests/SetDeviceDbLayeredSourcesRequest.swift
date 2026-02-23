/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import Dto


public struct SetDeviceDbLayeredSourcesRequest: Serializable {
    public var sources: [Dto.DeviceDbSource]

    public init(sources: [Dto.DeviceDbSource] = []) {
        self.sources = sources
    }
}
