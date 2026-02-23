/* This file is generated. Do not modify by hand. */

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
