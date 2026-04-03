// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoProduct


public struct Ge1GripperGetErrorResponse: Serializable {
    public var value: DtoProduct.Ge1GripperError

    public init(value: DtoProduct.Ge1GripperError = Ge1GripperError(rawValue: 0)!) {
        self.value = value
    }
}
