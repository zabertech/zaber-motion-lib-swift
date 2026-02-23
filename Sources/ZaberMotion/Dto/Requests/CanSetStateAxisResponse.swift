/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct CanSetStateAxisResponse: Serializable {
    public var error: String?
    public var axisNumber: Int

    public init(error: String? = nil, axisNumber: Int = 0) {
        self.error = error
        self.axisNumber = axisNumber
    }
}
