/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

/**
 * Data representing a sequence of pvt points with defined positions, velocities and times.
 */
public struct PvtSequenceData: Serializable {

    /**
     * Pvt sequence positions for each axis.
     */
    public var positions: [MeasurementSequence]

    /**
     * Pvt velocities for each axis.
     */
    public var velocities: [MeasurementSequence]

    /**
     * Relative times corresponding to points in PVT sequence.
     */
    public var times: MeasurementSequence

    public init(positions: [MeasurementSequence] = [], velocities: [MeasurementSequence] = [], times: MeasurementSequence = MeasurementSequence()) {
        self.positions = positions
        self.velocities = velocities
        self.times = times
    }
}
