// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoMicroscopy


public struct MicroscopeConfigResponse: Serializable {
    public var config: DtoMicroscopy.MicroscopeConfig

    public init(config: DtoMicroscopy.MicroscopeConfig = MicroscopeConfig()) {
        self.config = config
    }
}
