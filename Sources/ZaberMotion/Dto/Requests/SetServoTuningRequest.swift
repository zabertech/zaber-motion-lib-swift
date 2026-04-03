// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct SetServoTuningRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var paramset: DtoAscii.ServoTuningParamset
    public var tuningParams: [DtoAscii.ServoTuningParam]
    public var setUnspecifiedToDefault: Bool

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, paramset: DtoAscii.ServoTuningParamset = ServoTuningParamset(rawValue: 0)!, tuningParams: [DtoAscii.ServoTuningParam] = [], setUnspecifiedToDefault: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.paramset = paramset
        self.tuningParams = tuningParams
        self.setUnspecifiedToDefault = setUnspecifiedToDefault
    }
}
