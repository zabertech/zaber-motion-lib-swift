// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import Dto


public struct MoveableMoveSinRequest: Serializable {
    public var moveableId: Int
    public var amplitude: Dto.MeasurementOrValue
    public var period: Dto.MeasurementOrValue
    public var count: Double
    public var waitUntilIdle: Bool

    public init(moveableId: Int = 0, amplitude: Dto.MeasurementOrValue = .double(0.0), period: Dto.MeasurementOrValue = .double(0.0), count: Double = 0.0, waitUntilIdle: Bool = false) {
        self.moveableId = moveableId
        self.amplitude = amplitude
        self.period = period
        self.count = count
        self.waitUntilIdle = waitUntilIdle
    }
}
