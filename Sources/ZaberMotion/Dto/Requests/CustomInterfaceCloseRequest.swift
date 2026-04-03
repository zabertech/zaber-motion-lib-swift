// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct CustomInterfaceCloseRequest: Serializable {
    public var transportId: Int
    public var errorMessage: String

    public init(transportId: Int = 0, errorMessage: String = "") {
        self.transportId = transportId
        self.errorMessage = errorMessage
    }
}
