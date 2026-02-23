/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoAscii


public struct GenericCommandResponseCollection: Serializable {
    public var responses: [DtoAscii.Response]

    public init(responses: [DtoAscii.Response] = []) {
        self.responses = responses
    }
}
