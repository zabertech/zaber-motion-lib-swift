/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoBinary


public struct BinaryMessageCollection: Serializable {
    public var messages: [DtoBinary.Message]

    public init(messages: [DtoBinary.Message] = []) {
        self.messages = messages
    }
}
