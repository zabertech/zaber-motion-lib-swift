// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct GetIoPortLabelRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var portType: DtoAscii.IoPortType
    public var channelNumber: Int

    public init(interfaceId: Int = 0, device: Int = 0, portType: DtoAscii.IoPortType = IoPortType(rawValue: 0)!, channelNumber: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.portType = portType
        self.channelNumber = channelNumber
    }
}
