/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoBinary
import UnitsInternal


public struct BinaryGenericWithUnitsRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var command: DtoBinary.CommandCode
    public var data: Double
    public var fromUnit: Units
    public var toUnit: Units
    public var timeout: Double

    public init(interfaceId: Int = 0, device: Int = 0, command: DtoBinary.CommandCode = CommandCode(rawValue: 0)!, data: Double = 0.0, fromUnit: Units = Units.native, toUnit: Units = Units.native, timeout: Double = 0.0) {
        self.interfaceId = interfaceId
        self.device = device
        self.command = command
        self.data = data
        self.fromUnit = fromUnit
        self.toUnit = toUnit
        self.timeout = timeout
    }
}
