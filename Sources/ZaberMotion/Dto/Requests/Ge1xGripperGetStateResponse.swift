// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoProduct


public struct Ge1xGripperGetStateResponse: Serializable {
    public var value: DtoProduct.Ge1xGripperState

    public init(value: DtoProduct.Ge1xGripperState = Ge1xGripperState(rawValue: 0)!) {
        self.value = value
    }
}
