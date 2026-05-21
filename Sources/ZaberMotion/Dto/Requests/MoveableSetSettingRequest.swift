// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import Dto


public struct MoveableSetSettingRequest: Serializable {
    public var moveableId: Int
    public var value: Dto.MeasurementOrValue

    public init(moveableId: Int = 0, value: Dto.MeasurementOrValue = .double(0.0)) {
        self.moveableId = moveableId
        self.value = value
    }
}
