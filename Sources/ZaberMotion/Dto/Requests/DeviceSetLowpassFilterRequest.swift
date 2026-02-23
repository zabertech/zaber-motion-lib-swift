/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import UnitsInternal


public struct DeviceSetLowpassFilterRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var channelNumber: Int
    public var cutoffFrequency: Double
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, channelNumber: Int = 0, cutoffFrequency: Double = 0.0, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.channelNumber = channelNumber
        self.cutoffFrequency = cutoffFrequency
        self.unit = unit
    }
}
