/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoAscii
import Dto


public struct PvtGenerateVelocitiesAndTimesRequest: Serializable {
    public var positions: [DtoAscii.MeasurementSequence]
    public var targetSpeed: Dto.Measurement
    public var targetAcceleration: Dto.Measurement
    public var resampleNumber: Int?

    public init(positions: [DtoAscii.MeasurementSequence] = [], targetSpeed: Dto.Measurement = Measurement(), targetAcceleration: Dto.Measurement = Measurement(), resampleNumber: Int? = nil) {
        self.positions = positions
        self.targetSpeed = targetSpeed
        self.targetAcceleration = targetAcceleration
        self.resampleNumber = resampleNumber
    }
}
