// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import UnitsInternal


public struct ProcessOn: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var on: Bool
    public var duration: Double
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, on: Bool = false, duration: Double = 0.0, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.on = on
        self.duration = duration
        self.unit = unit
    }
}
