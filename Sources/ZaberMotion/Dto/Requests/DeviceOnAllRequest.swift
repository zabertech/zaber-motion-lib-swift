/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct DeviceOnAllRequest: Serializable {
    public var interfaceId: Int
    public var waitUntilIdle: Bool

    public init(interfaceId: Int = 0, waitUntilIdle: Bool = false) {
        self.interfaceId = interfaceId
        self.waitUntilIdle = waitUntilIdle
    }
}
