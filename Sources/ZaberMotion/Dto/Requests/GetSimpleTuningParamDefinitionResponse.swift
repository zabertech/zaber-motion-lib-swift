// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct GetSimpleTuningParamDefinitionResponse: Serializable {
    public var params: [DtoAscii.SimpleTuningParamDefinition]

    public init(params: [DtoAscii.SimpleTuningParamDefinition] = []) {
        self.params = params
    }
}
