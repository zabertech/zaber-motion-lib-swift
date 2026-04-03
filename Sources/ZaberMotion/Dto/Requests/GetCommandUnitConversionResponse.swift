// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import Dto


public struct GetCommandUnitConversionResponse: Serializable {
    public var value: [Dto.UnitConversionDescriptor?]

    public init(value: [Dto.UnitConversionDescriptor?] = []) {
        self.value = value
    }
}
