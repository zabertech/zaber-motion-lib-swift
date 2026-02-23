/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import UnitsInternal


public struct TranslatorGetAxisPositionRequest: Serializable {
    public var translatorId: Int
    public var axis: String
    public var unit: Units

    public init(translatorId: Int = 0, axis: String = "", unit: Units = Units.native) {
        self.translatorId = translatorId
        self.axis = axis
        self.unit = unit
    }
}
