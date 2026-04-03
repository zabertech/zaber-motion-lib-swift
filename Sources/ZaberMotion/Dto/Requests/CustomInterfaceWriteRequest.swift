// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

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
