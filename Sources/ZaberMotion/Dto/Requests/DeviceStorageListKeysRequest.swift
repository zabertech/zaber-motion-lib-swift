// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct DeviceStorageListKeysRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var prefix: String?

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, prefix: String? = nil) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.prefix = prefix
    }
}
