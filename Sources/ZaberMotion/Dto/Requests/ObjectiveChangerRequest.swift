// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct ObjectiveChangerRequest: Serializable {
    public var interfaceId: Int
    public var turretAddress: Int
    public var focusAddress: Int
    public var focusAxis: Int

    public init(interfaceId: Int = 0, turretAddress: Int = 0, focusAddress: Int = 0, focusAxis: Int = 0) {
        self.interfaceId = interfaceId
        self.turretAddress = turretAddress
        self.focusAddress = focusAddress
        self.focusAxis = focusAxis
    }
}
