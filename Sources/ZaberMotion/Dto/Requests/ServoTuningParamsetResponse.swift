// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct ServoTuningParamsetResponse: Serializable {
    public var paramset: DtoAscii.ServoTuningParamset

    public init(paramset: DtoAscii.ServoTuningParamset = ServoTuningParamset(rawValue: 0)!) {
        self.paramset = paramset
    }
}
