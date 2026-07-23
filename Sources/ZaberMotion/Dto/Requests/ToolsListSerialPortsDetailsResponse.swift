// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import Dto


public struct ToolsListSerialPortsDetailsResponse: Serializable {
    public var ports: [Dto.SerialPortDetails]

    public init(ports: [Dto.SerialPortDetails] = []) {
        self.ports = ports
    }
}
