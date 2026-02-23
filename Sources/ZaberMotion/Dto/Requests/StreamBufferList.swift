/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct StreamBufferList: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var pvt: Bool

    public init(interfaceId: Int = 0, device: Int = 0, pvt: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.pvt = pvt
    }
}
