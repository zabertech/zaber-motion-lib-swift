/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct StreamBufferEraseRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var bufferId: Int
    public var pvt: Bool

    public init(interfaceId: Int = 0, device: Int = 0, bufferId: Int = 0, pvt: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.bufferId = bufferId
        self.pvt = pvt
    }
}
