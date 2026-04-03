// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct GatewayResponse: Serializable {
    public var response: ResponseType
    public var errorType: Errors
    public var errorMessage: String

    public init(response: ResponseType = ResponseType(rawValue: 0)!, errorType: Errors = Errors(rawValue: 0)!, errorMessage: String = "") {
        self.response = response
        self.errorType = errorType
        self.errorMessage = errorMessage
    }
}
