// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii
import UnitsInternal


public struct PvtBufferGetSequenceDataRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var bufferNumber: Int
    public var axes: [DtoAscii.PvtBufferAxisUnits]?
    public var timeUnits: Units

    public init(interfaceId: Int = 0, device: Int = 0, bufferNumber: Int = 0, axes: [DtoAscii.PvtBufferAxisUnits]? = nil, timeUnits: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.bufferNumber = bufferNumber
        self.axes = axes
        self.timeUnits = timeUnits
    }
}
