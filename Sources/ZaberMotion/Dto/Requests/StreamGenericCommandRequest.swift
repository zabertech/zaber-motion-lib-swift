// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct StreamGenericCommandRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var pvt: Bool
    public var command: String

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, pvt: Bool = false, command: String = "") {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.pvt = pvt
        self.command = command
    }
}
