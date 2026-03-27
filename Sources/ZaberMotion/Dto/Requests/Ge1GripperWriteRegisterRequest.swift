/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct Ge1GripperWriteRegisterRequest: Serializable {
    public var connectionId: Int
    public var registerAddress: Int
    public var data: Int

    public init(connectionId: Int = 0, registerAddress: Int = 0, data: Int = 0) {
        self.connectionId = connectionId
        self.registerAddress = registerAddress
        self.data = data
    }
}
