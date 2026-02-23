/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoAscii


public struct StreamSetupLiveCompositeRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var pvt: Bool
    public var axes: [DtoAscii.StreamAxisDefinition]
    public var pvtAxes: [DtoAscii.PvtAxisDefinition]

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, pvt: Bool = false, axes: [DtoAscii.StreamAxisDefinition] = [], pvtAxes: [DtoAscii.PvtAxisDefinition] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.pvt = pvt
        self.axes = axes
        self.pvtAxes = pvtAxes
    }
}
