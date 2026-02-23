/* This file is generated. Do not modify by hand. */

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
