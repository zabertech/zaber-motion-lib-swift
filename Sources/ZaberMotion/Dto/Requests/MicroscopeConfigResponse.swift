/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoMicroscopy


public struct MicroscopeConfigResponse: Serializable {
    public var config: DtoMicroscopy.MicroscopeConfig

    public init(config: DtoMicroscopy.MicroscopeConfig = MicroscopeConfig()) {
        self.config = config
    }
}
