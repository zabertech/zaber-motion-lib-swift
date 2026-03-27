/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct Ge1GripperSetIoInputFilterRequest: Serializable {
    public var connectionId: Int
    public var duration: Int
    public var saveToFlash: Bool

    public init(connectionId: Int = 0, duration: Int = 0, saveToFlash: Bool = false) {
        self.connectionId = connectionId
        self.duration = duration
        self.saveToFlash = saveToFlash
    }
}
