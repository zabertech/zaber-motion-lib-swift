// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoGcode


public struct TranslatorCreateLiveRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var config: DtoGcode.TranslatorConfig?

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, config: DtoGcode.TranslatorConfig? = nil) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.config = config
    }
}
