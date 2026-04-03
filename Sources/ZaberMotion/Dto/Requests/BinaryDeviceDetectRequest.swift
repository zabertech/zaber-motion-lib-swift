// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct BinaryDeviceDetectRequest: Serializable {
    public var interfaceId: Int
    public var identifyDevices: Bool

    public init(interfaceId: Int = 0, identifyDevices: Bool = false) {
        self.interfaceId = interfaceId
        self.identifyDevices = identifyDevices
    }
}
