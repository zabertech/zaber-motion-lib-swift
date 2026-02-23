/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoGcode


public struct TranslatorCreateRequest: Serializable {
    public var definition: DtoGcode.DeviceDefinition
    public var config: DtoGcode.TranslatorConfig?

    public init(definition: DtoGcode.DeviceDefinition = DeviceDefinition(), config: DtoGcode.TranslatorConfig? = nil) {
        self.definition = definition
        self.config = config
    }
}
