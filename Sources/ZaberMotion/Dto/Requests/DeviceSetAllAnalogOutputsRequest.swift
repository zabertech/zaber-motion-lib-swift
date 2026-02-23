/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct DeviceSetAllAnalogOutputsRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var values: [Double]

    public init(interfaceId: Int = 0, device: Int = 0, values: [Double] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.values = values
    }
}
