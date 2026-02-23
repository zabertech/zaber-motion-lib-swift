/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoAscii


public struct GetSimpleTuningParamDefinitionResponse: Serializable {
    public var params: [DtoAscii.SimpleTuningParamDefinition]

    public init(params: [DtoAscii.SimpleTuningParamDefinition] = []) {
        self.params = params
    }
}
