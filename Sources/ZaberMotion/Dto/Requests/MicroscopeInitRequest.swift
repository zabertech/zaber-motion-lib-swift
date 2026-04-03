// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoMicroscopy


public struct MicroscopeInitRequest: Serializable {
    public var interfaceId: Int
    public var config: DtoMicroscopy.MicroscopeConfig
    public var force: Bool

    public init(interfaceId: Int = 0, config: DtoMicroscopy.MicroscopeConfig = MicroscopeConfig(), force: Bool = false) {
        self.interfaceId = interfaceId
        self.config = config
        self.force = force
    }
}
