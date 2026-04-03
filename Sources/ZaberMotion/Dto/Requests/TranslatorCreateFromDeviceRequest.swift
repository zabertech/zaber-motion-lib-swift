// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoGcode


public struct TranslatorCreateFromDeviceRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axes: [Int]
    public var config: DtoGcode.TranslatorConfig?

    public init(interfaceId: Int = 0, device: Int = 0, axes: [Int] = [], config: DtoGcode.TranslatorConfig? = nil) {
        self.interfaceId = interfaceId
        self.device = device
        self.axes = axes
        self.config = config
    }
}
