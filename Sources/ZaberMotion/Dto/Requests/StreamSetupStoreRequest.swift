/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct StreamSetupStoreRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var pvt: Bool
    public var streamBuffer: Int
    public var pvtBuffer: Int
    public var axes: [Int]

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, pvt: Bool = false, streamBuffer: Int = 0, pvtBuffer: Int = 0, axes: [Int] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.pvt = pvt
        self.streamBuffer = streamBuffer
        self.pvtBuffer = pvtBuffer
        self.axes = axes
    }
}
