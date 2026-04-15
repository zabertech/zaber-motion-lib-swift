// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct Ge1xGripperSetPresetRequest: Serializable {
    public var connectionId: Int
    public var presetNumber: Int
    public var position: Double
    public var force: Int
    public var speed: Int
    public var saveToFlash: Bool

    public init(connectionId: Int = 0, presetNumber: Int = 0, position: Double = 0.0, force: Int = 0, speed: Int = 0, saveToFlash: Bool = false) {
        self.connectionId = connectionId
        self.presetNumber = presetNumber
        self.position = position
        self.force = force
        self.speed = speed
        self.saveToFlash = saveToFlash
    }
}
