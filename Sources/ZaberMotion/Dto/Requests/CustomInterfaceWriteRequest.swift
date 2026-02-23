/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct CustomInterfaceWriteRequest: Serializable {
    public var transportId: Int
    public var message: String

    public init(transportId: Int = 0, message: String = "") {
        self.transportId = transportId
        self.message = message
    }
}
