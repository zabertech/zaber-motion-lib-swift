/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct Ge1GripperCalibrateRequest: Serializable {
    public var connectionId: Int
    public var saveToFlash: Bool

    public init(connectionId: Int = 0, saveToFlash: Bool = false) {
        self.connectionId = connectionId
        self.saveToFlash = saveToFlash
    }
}
