/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import Dto


public struct CanSetStateRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var state: String
    public var firmwareVersion: Dto.FirmwareVersion?

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, state: String = "", firmwareVersion: Dto.FirmwareVersion? = nil) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.state = state
        self.firmwareVersion = firmwareVersion
    }
}
