// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct StreamGetAxesResponse: Serializable {
    public var axes: [DtoAscii.StreamAxisDefinition]
    public var pvtAxes: [DtoAscii.PvtAxisDefinition]

    public init(axes: [DtoAscii.StreamAxisDefinition] = [], pvtAxes: [DtoAscii.PvtAxisDefinition] = []) {
        self.axes = axes
        self.pvtAxes = pvtAxes
    }
}
