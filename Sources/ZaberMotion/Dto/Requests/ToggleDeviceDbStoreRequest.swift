// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct ToggleDeviceDbStoreRequest: Serializable {
    public var toggleOn: Bool
    public var storeLocation: String?

    public init(toggleOn: Bool = false, storeLocation: String? = nil) {
        self.toggleOn = toggleOn
        self.storeLocation = storeLocation
    }
}
