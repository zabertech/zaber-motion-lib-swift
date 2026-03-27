/* This file is generated. Do not modify by hand. */

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
