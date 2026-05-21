// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import Dto


public struct MoveableMoveRequest: Serializable {
    public var moveableId: Int
    public var position: Dto.MeasurementOrValue?
    public var velocity: Dto.MeasurementOrValue?
    public var acceleration: Dto.MeasurementOrValue?
    public var waitUntilIdle: Bool
    public var cyclicDirection: Dto.CyclicDirection?
    public var extraCycles: Int?

    public init(moveableId: Int = 0, position: Dto.MeasurementOrValue? = nil, velocity: Dto.MeasurementOrValue? = nil, acceleration: Dto.MeasurementOrValue? = nil, waitUntilIdle: Bool = false, cyclicDirection: Dto.CyclicDirection? = nil, extraCycles: Int? = nil) {
        self.moveableId = moveableId
        self.position = position
        self.velocity = velocity
        self.acceleration = acceleration
        self.waitUntilIdle = waitUntilIdle
        self.cyclicDirection = cyclicDirection
        self.extraCycles = extraCycles
    }
}
