// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import Dto


/**
 * Data representing a single point in a PVT sequence or buffer.
 */
public struct PvtPoint: Serializable {

    /**
     * Position of this point for all series (axes).
     */
    public var positions: [Dto.Measurement]

    /**
     * Velocity at this point for all series (axes).
     */
    public var velocities: [Dto.Measurement]

    /**
     * Time to take to reach this point from the previous point or starting position.
     */
    public var time: Dto.Measurement

    /**
     * Flag indicating if this point's position is relative to the previous point or starting position.
     * Defaults to false, meaning absolute positioning.
     */
    public var relative: Bool

    public init(positions: [Dto.Measurement] = [], velocities: [Dto.Measurement] = [], time: Dto.Measurement = Measurement(), relative: Bool = false) {
        self.positions = positions
        self.velocities = velocities
        self.time = time
        self.relative = relative
    }
}
