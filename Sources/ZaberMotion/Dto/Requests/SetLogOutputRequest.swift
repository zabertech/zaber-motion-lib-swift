// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import Dto


public struct SetLogOutputRequest: Serializable {
    public var mode: Dto.LogOutputMode
    public var filePath: String?

    public init(mode: Dto.LogOutputMode = LogOutputMode(rawValue: 0)!, filePath: String? = nil) {
        self.mode = mode
        self.filePath = filePath
    }
}
