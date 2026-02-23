/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import UnitsInternal


public struct TranslatorSetTraverseRateRequest: Serializable {
    public var translatorId: Int
    public var traverseRate: Double
    public var unit: Units

    public init(translatorId: Int = 0, traverseRate: Double = 0.0, unit: Units = Units.native) {
        self.translatorId = translatorId
        self.traverseRate = traverseRate
        self.unit = unit
    }
}
