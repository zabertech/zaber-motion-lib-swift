/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct OpenBinaryInterfaceRequest: Serializable {
    public var interfaceType: InterfaceType
    public var portName: String
    public var baudRate: Int
    public var hostName: String
    public var port: Int
    public var useMessageIds: Bool

    public init(interfaceType: InterfaceType = InterfaceType(rawValue: 0)!, portName: String = "", baudRate: Int = 0, hostName: String = "", port: Int = 0, useMessageIds: Bool = false) {
        self.interfaceType = interfaceType
        self.portName = portName
        self.baudRate = baudRate
        self.hostName = hostName
        self.port = port
        self.useMessageIds = useMessageIds
    }
}
