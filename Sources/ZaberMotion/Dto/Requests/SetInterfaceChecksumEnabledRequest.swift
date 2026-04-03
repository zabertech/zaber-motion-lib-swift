// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct SetInterfaceChecksumEnabledRequest: Serializable {
    public var interfaceId: Int
    public var isEnabled: Bool

    public init(interfaceId: Int = 0, isEnabled: Bool = false) {
        self.interfaceId = interfaceId
        self.isEnabled = isEnabled
    }
}
