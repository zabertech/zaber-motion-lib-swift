/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoAscii


public struct OscilloscopeAddIoChannelRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var ioType: DtoAscii.IoPortType
    public var ioChannel: Int

    public init(interfaceId: Int = 0, device: Int = 0, ioType: DtoAscii.IoPortType = IoPortType(rawValue: 0)!, ioChannel: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.ioType = ioType
        self.ioChannel = ioChannel
    }
}
