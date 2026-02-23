/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoAscii


public struct StreamSetupStoreCompositeRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var pvt: Bool
    public var streamBuffer: Int
    public var pvtBuffer: Int
    public var axes: [DtoAscii.StreamAxisDefinition]
    public var pvtAxes: [DtoAscii.PvtAxisDefinition]

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, pvt: Bool = false, streamBuffer: Int = 0, pvtBuffer: Int = 0, axes: [DtoAscii.StreamAxisDefinition] = [], pvtAxes: [DtoAscii.PvtAxisDefinition] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.pvt = pvt
        self.streamBuffer = streamBuffer
        self.pvtBuffer = pvtBuffer
        self.axes = axes
        self.pvtAxes = pvtAxes
    }
}
