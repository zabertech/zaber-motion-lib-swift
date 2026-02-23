/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct WaitToRespondRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var timeout: Double

    public init(interfaceId: Int = 0, device: Int = 0, timeout: Double = 0.0) {
        self.interfaceId = interfaceId
        self.device = device
        self.timeout = timeout
    }
}
