// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii
import UnitsInternal


public struct StreamSetAllDigitalOutputsScheduleRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var pvt: Bool
    public var values: [DtoAscii.DigitalOutputAction]
    public var futureValues: [DtoAscii.DigitalOutputAction]
    public var delay: Double
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, pvt: Bool = false, values: [DtoAscii.DigitalOutputAction] = [], futureValues: [DtoAscii.DigitalOutputAction] = [], delay: Double = 0.0, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.pvt = pvt
        self.values = values
        self.futureValues = futureValues
        self.delay = delay
        self.unit = unit
    }
}
