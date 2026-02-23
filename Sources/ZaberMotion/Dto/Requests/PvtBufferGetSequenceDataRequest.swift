/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct PvtBufferGetSequenceDataRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var bufferId: Int

    public init(interfaceId: Int = 0, device: Int = 0, bufferId: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.bufferId = bufferId
    }
}
