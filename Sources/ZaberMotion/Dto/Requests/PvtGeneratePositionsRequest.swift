/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoAscii


public struct PvtGeneratePositionsRequest: Serializable {
    public var velocities: [DtoAscii.MeasurementSequence]
    public var times: DtoAscii.MeasurementSequence
    public var timesRelative: Bool

    public init(velocities: [DtoAscii.MeasurementSequence] = [], times: DtoAscii.MeasurementSequence = MeasurementSequence(), timesRelative: Bool = false) {
        self.velocities = velocities
        self.times = times
        self.timesRelative = timesRelative
    }
}
