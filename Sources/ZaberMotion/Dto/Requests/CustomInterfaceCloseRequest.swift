/* This file is generated. Do not modify by hand. */

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
