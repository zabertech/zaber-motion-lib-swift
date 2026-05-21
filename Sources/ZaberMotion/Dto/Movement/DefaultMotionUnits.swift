// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import UnitsInternal


/**
 * Default units of measurement for movement operations.
 */
public struct DefaultMotionUnits: Serializable {

    /**
     * Default unit for position.
     */
    public var position: Units?

    /**
     * Default unit for velocity.
     */
    public var speed: Units?

    /**
     * Default unit for acceleration.
     */
    public var acceleration: Units?

    /**
     * Default unit for time.
     */
    public var time: Units?

    public init(position: Units? = nil, speed: Units? = nil, acceleration: Units? = nil, time: Units? = nil) {
        self.position = position
        self.speed = speed
        self.acceleration = acceleration
        self.time = time
    }
}
