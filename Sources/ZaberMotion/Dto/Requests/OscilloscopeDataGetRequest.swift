// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import UnitsInternal


public struct OscilloscopeDataGetRequest: Serializable {
    public var dataId: Int
    public var unit: Units

    public init(dataId: Int = 0, unit: Units = Units.native) {
        self.dataId = dataId
        self.unit = unit
    }
}
