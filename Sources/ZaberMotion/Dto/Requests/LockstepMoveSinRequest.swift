// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import UnitsInternal


public struct LockstepMoveSinRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var lockstepGroupId: Int
    public var amplitude: Double
    public var amplitudeUnits: Units
    public var period: Double
    public var periodUnits: Units
    public var count: Double
    public var waitUntilIdle: Bool

    public init(interfaceId: Int = 0, device: Int = 0, lockstepGroupId: Int = 0, amplitude: Double = 0.0, amplitudeUnits: Units = Units.native, period: Double = 0.0, periodUnits: Units = Units.native, count: Double = 0.0, waitUntilIdle: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.lockstepGroupId = lockstepGroupId
        self.amplitude = amplitude
        self.amplitudeUnits = amplitudeUnits
        self.period = period
        self.periodUnits = periodUnits
        self.count = count
        self.waitUntilIdle = waitUntilIdle
    }
}
