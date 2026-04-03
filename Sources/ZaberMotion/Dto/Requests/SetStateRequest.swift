// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct SetStateRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var state: String
    public var deviceOnly: Bool

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, state: String = "", deviceOnly: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.state = state
        self.deviceOnly = deviceOnly
    }
}
