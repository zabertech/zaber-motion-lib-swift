// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoProduct


public struct Ge1GripperGetStateResponse: Serializable {
    public var value: DtoProduct.Ge1GripperState

    public init(value: DtoProduct.Ge1GripperState = Ge1GripperState(rawValue: 0)!) {
        self.value = value
    }
}
