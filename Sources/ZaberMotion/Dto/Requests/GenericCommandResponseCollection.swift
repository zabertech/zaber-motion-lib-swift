// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct GenericCommandResponseCollection: Serializable {
    public var responses: [DtoAscii.Response]

    public init(responses: [DtoAscii.Response] = []) {
        self.responses = responses
    }
}
