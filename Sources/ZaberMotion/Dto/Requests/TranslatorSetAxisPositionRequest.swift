/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import UnitsInternal


public struct TranslatorSetAxisPositionRequest: Serializable {
    public var translatorId: Int
    public var axis: String
    public var position: Double
    public var unit: Units

    public init(translatorId: Int = 0, axis: String = "", position: Double = 0.0, unit: Units = Units.native) {
        self.translatorId = translatorId
        self.axis = axis
        self.position = position
        self.unit = unit
    }
}
