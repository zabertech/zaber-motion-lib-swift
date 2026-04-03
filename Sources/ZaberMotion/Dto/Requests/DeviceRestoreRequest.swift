// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct DeviceRestoreRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var hard: Bool

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, hard: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.hard = hard
    }
}
