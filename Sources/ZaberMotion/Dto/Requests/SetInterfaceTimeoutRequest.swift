/* This file is generated. Do not modify by hand. */

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
