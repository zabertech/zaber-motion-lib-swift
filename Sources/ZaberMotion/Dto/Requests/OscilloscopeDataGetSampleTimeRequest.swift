// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import UnitsInternal


public struct OscilloscopeDataGetSampleTimeRequest: Serializable {
    public var dataId: Int
    public var unit: Units
    public var index: Int

    public init(dataId: Int = 0, unit: Units = Units.native, index: Int = 0) {
        self.dataId = dataId
        self.unit = unit
        self.index = index
    }
}
