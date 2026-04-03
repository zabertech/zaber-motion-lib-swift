// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct SetInterfaceTimeoutRequest: Serializable {
    public var interfaceId: Int
    public var timeout: Int

    public init(interfaceId: Int = 0, timeout: Int = 0) {
        self.interfaceId = interfaceId
        self.timeout = timeout
    }
}
