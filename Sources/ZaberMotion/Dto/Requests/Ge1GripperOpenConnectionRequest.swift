// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct Ge1GripperOpenConnectionRequest: Serializable {
    public var portName: String
    public var deviceAddress: Int
    public var timeout: Int

    public init(portName: String = "", deviceAddress: Int = 0, timeout: Int = 0) {
        self.portName = portName
        self.deviceAddress = deviceAddress
        self.timeout = timeout
    }
}
