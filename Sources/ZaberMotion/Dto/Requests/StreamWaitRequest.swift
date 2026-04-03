// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import UnitsInternal


public struct StreamWaitRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var pvt: Bool
    public var time: Double
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, pvt: Bool = false, time: Double = 0.0, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.pvt = pvt
        self.time = time
        self.unit = unit
    }
}
