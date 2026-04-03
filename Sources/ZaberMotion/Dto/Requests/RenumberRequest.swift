// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct RenumberRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var address: Int

    public init(interfaceId: Int = 0, device: Int = 0, address: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.address = address
    }
}
