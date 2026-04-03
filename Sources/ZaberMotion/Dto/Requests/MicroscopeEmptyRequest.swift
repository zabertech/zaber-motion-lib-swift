// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoMicroscopy


public struct MicroscopeEmptyRequest: Serializable {
    public var interfaceId: Int
    public var config: DtoMicroscopy.MicroscopeConfig

    public init(interfaceId: Int = 0, config: DtoMicroscopy.MicroscopeConfig = MicroscopeConfig()) {
        self.interfaceId = interfaceId
        self.config = config
    }
}
