/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoProduct


public struct SetProcessControllerSource: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var source: DtoProduct.ProcessControllerSource

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, source: DtoProduct.ProcessControllerSource = ProcessControllerSource()) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.source = source
    }
}
