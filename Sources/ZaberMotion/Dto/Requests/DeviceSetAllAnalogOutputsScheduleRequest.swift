/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import UnitsInternal


public struct DeviceSetAllAnalogOutputsScheduleRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var values: [Double]
    public var futureValues: [Double]
    public var delay: Double
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, values: [Double] = [], futureValues: [Double] = [], delay: Double = 0.0, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.values = values
        self.futureValues = futureValues
        self.delay = delay
        self.unit = unit
    }
}
