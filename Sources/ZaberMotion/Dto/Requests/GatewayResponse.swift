// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct GatewayResponse: Serializable {
    public var response: ResponseType

    public init(response: ResponseType = ResponseType(rawValue: 0)!) {
        self.response = response
    }
}
