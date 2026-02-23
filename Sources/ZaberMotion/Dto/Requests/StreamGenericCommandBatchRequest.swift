/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct StreamGenericCommandBatchRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var pvt: Bool
    public var batch: [String]

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, pvt: Bool = false, batch: [String] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.pvt = pvt
        self.batch = batch
    }
}
