// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct DeviceHasCommandRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var command: String
    public var allowPartial: Bool

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, command: String = "", allowPartial: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.command = command
        self.allowPartial = allowPartial
    }
}
