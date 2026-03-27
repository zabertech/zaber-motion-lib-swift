/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoAscii
import Dto


public struct PvtGenerateVelocitiesAndTimesRequest: Serializable {
    public var sequenceItems: [DtoAscii.PvtPartialSequenceItem]
    public var targetSpeed: Dto.Measurement
    public var targetAcceleration: Dto.Measurement
    public var resampleNumber: Int?

    public init(sequenceItems: [DtoAscii.PvtPartialSequenceItem] = [], targetSpeed: Dto.Measurement = Measurement(), targetAcceleration: Dto.Measurement = Measurement(), resampleNumber: Int? = nil) {
        self.sequenceItems = sequenceItems
        self.targetSpeed = targetSpeed
        self.targetAcceleration = targetAcceleration
        self.resampleNumber = resampleNumber
    }
}
