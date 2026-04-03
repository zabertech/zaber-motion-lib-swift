// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

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
