// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct Ge1GripperSetSpeedRequest: Serializable {
    public var connectionId: Int
    public var speed: Int

    public init(connectionId: Int = 0, speed: Int = 0) {
        self.connectionId = connectionId
        self.speed = speed
    }
}
