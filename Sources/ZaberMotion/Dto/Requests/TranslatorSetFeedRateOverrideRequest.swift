/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct TranslatorSetFeedRateOverrideRequest: Serializable {
    public var translatorId: Int
    public var coefficient: Double

    public init(translatorId: Int = 0, coefficient: Double = 0.0) {
        self.translatorId = translatorId
        self.coefficient = coefficient
    }
}
