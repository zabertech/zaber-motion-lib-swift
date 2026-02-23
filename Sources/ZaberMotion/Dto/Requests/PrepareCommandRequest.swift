/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import Dto


public struct PrepareCommandRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var commandTemplate: String
    public var parameters: [Dto.Measurement]

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, commandTemplate: String = "", parameters: [Dto.Measurement] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.commandTemplate = commandTemplate
        self.parameters = parameters
    }
}
