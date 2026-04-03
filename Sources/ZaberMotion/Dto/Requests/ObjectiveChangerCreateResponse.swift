// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct ObjectiveChangerCreateResponse: Serializable {
    public var turret: Int
    public var focusAddress: Int
    public var focusAxis: Int

    public init(turret: Int = 0, focusAddress: Int = 0, focusAxis: Int = 0) {
        self.turret = turret
        self.focusAddress = focusAddress
        self.focusAxis = focusAxis
    }
}
