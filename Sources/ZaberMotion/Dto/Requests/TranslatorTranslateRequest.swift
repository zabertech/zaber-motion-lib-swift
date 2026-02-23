/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct TranslatorTranslateRequest: Serializable {
    public var translatorId: Int
    public var block: String

    public init(translatorId: Int = 0, block: String = "") {
        self.translatorId = translatorId
        self.block = block
    }
}
