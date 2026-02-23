/* This file is generated. Do not modify by hand. */

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
