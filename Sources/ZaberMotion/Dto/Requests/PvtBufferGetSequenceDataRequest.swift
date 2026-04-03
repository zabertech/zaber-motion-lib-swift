// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct PvtBufferGetSequenceDataRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var bufferNumber: Int

    public init(interfaceId: Int = 0, device: Int = 0, bufferNumber: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.bufferNumber = bufferNumber
    }
}
