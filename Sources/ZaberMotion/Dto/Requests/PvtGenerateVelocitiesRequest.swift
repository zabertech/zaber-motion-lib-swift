/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoAscii


public struct PvtGenerateVelocitiesRequest: Serializable {
    public var positions: [DtoAscii.MeasurementSequence]
    public var velocities: [DtoAscii.OptionalMeasurementSequence]?
    public var times: DtoAscii.MeasurementSequence
    public var timesRelative: Bool

    public init(positions: [DtoAscii.MeasurementSequence] = [], velocities: [DtoAscii.OptionalMeasurementSequence]? = nil, times: DtoAscii.MeasurementSequence = MeasurementSequence(), timesRelative: Bool = false) {
        self.positions = positions
        self.velocities = velocities
        self.times = times
        self.timesRelative = timesRelative
    }
}
