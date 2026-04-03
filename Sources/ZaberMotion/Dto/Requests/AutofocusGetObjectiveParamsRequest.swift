// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct AutofocusGetObjectiveParamsRequest: Serializable {
    public var providerId: Int
    public var interfaceId: Int
    public var focusAddress: Int
    public var focusAxis: Int
    public var turretAddress: Int
    public var objective: Int

    public init(providerId: Int = 0, interfaceId: Int = 0, focusAddress: Int = 0, focusAxis: Int = 0, turretAddress: Int = 0, objective: Int = 0) {
        self.providerId = providerId
        self.interfaceId = interfaceId
        self.focusAddress = focusAddress
        self.focusAxis = focusAxis
        self.turretAddress = turretAddress
        self.objective = objective
    }
}
