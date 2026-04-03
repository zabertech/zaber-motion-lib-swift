// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct StreamBufferGetContentRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var bufferNumber: Int
    public var pvt: Bool

    public init(interfaceId: Int = 0, device: Int = 0, bufferNumber: Int = 0, pvt: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.bufferNumber = bufferNumber
        self.pvt = pvt
    }
}
