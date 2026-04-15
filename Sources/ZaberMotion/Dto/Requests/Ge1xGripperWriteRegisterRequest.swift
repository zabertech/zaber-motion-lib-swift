// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct Ge1xGripperWriteRegisterRequest: Serializable {
    public var connectionId: Int
    public var registerAddress: Int
    public var data: Int

    public init(connectionId: Int = 0, registerAddress: Int = 0, data: Int = 0) {
        self.connectionId = connectionId
        self.registerAddress = registerAddress
        self.data = data
    }
}
