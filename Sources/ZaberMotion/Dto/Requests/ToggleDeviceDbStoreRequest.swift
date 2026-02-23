/* This file is generated. Do not modify by hand. */

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
