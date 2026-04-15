// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoProduct


public struct Ge1xGripperGetErrorResponse: Serializable {
    public var value: DtoProduct.Ge1xGripperError

    public init(value: DtoProduct.Ge1xGripperError = Ge1xGripperError(rawValue: 0)!) {
        self.value = value
    }
}
