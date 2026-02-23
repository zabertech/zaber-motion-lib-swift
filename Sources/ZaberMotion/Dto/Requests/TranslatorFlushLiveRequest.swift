/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct TranslatorFlushLiveRequest: Serializable {
    public var translatorId: Int
    public var waitUntilIdle: Bool

    public init(translatorId: Int = 0, waitUntilIdle: Bool = false) {
        self.translatorId = translatorId
        self.waitUntilIdle = waitUntilIdle
    }
}
