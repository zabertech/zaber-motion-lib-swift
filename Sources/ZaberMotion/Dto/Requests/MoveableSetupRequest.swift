// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoMovement


public struct MoveableSetupRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var moveableNumber: Int
    public var moveableType: MoveableType
    public var defaultUnits: DtoMovement.DefaultMotionUnits?

    public init(interfaceId: Int = 0, device: Int = 0, moveableNumber: Int = 0, moveableType: MoveableType = MoveableType(rawValue: 0)!, defaultUnits: DtoMovement.DefaultMotionUnits? = nil) {
        self.interfaceId = interfaceId
        self.device = device
        self.moveableNumber = moveableNumber
        self.moveableType = moveableType
        self.defaultUnits = defaultUnits
    }
}
