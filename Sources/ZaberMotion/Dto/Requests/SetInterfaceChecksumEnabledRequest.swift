/* This file is generated. Do not modify by hand. */

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
