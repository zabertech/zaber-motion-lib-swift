/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoAscii


public struct ServoTuningParamsetResponse: Serializable {
    public var paramset: DtoAscii.ServoTuningParamset

    public init(paramset: DtoAscii.ServoTuningParamset = ServoTuningParamset(rawValue: 0)!) {
        self.paramset = paramset
    }
}
