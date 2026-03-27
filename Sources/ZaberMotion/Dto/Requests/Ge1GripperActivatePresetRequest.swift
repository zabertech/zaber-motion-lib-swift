/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct Ge1GripperActivatePresetRequest: Serializable {
    public var connectionId: Int
    public var presetNumber: Int
    public var waitUntilIdle: Bool

    public init(connectionId: Int = 0, presetNumber: Int = 0, waitUntilIdle: Bool = false) {
        self.connectionId = connectionId
        self.presetNumber = presetNumber
        self.waitUntilIdle = waitUntilIdle
    }
}
