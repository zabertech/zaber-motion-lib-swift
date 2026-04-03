// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoBinary


public struct BinaryMessageCollection: Serializable {
    public var messages: [DtoBinary.Message]

    public init(messages: [DtoBinary.Message] = []) {
        self.messages = messages
    }
}
