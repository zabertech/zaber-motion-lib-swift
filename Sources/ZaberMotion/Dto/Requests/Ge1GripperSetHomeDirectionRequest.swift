/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoProduct


public struct Ge1GripperSetHomeDirectionRequest: Serializable {
    public var connectionId: Int
    public var direction: DtoProduct.Ge1GripperDirection
    public var saveToFlash: Bool

    public init(connectionId: Int = 0, direction: DtoProduct.Ge1GripperDirection = Ge1GripperDirection(rawValue: 0)!, saveToFlash: Bool = false) {
        self.connectionId = connectionId
        self.direction = direction
        self.saveToFlash = saveToFlash
    }
}
