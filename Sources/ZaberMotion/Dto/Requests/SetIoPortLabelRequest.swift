/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoAscii


public struct SetIoPortLabelRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var portType: DtoAscii.IoPortType
    public var channelNumber: Int
    public var label: String?

    public init(interfaceId: Int = 0, device: Int = 0, portType: DtoAscii.IoPortType = IoPortType(rawValue: 0)!, channelNumber: Int = 0, label: String? = nil) {
        self.interfaceId = interfaceId
        self.device = device
        self.portType = portType
        self.channelNumber = channelNumber
        self.label = label
    }
}
