// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import Dto
import DtoAscii


public struct MoveableSetAccelerationRequest: Serializable {
    public var moveableId: Int
    public var accel: Dto.MeasurementOrValue
    public var accelType: DtoAscii.AccelType?

    public init(moveableId: Int = 0, accel: Dto.MeasurementOrValue = .double(0.0), accelType: DtoAscii.AccelType? = nil) {
        self.moveableId = moveableId
        self.accel = accel
        self.accelType = accelType
    }
}
