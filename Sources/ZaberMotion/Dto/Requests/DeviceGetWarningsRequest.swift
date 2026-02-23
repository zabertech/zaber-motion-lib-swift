/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct DeviceGetWarningsRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var clear: Bool

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, clear: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.clear = clear
    }
}
