// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import UnitsInternal


public struct TranslatorGetAxisOffsetRequest: Serializable {
    public var translatorId: Int
    public var coordinateSystem: String
    public var axis: String
    public var unit: Units

    public init(translatorId: Int = 0, coordinateSystem: String = "", axis: String = "", unit: Units = Units.native) {
        self.translatorId = translatorId
        self.coordinateSystem = coordinateSystem
        self.axis = axis
        self.unit = unit
    }
}
