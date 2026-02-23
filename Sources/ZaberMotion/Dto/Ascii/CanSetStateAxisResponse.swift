/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

/**
 * An object containing any setup issues that will prevent setting a state to a given axis.
 */
public struct CanSetStateAxisResponse: Serializable {

    /**
     * The error blocking applying this state to the given axis, or null if there is no error.
     */
    public var error: String?

    /**
     * The number of the axis that cannot be set.
     */
    public var axisNumber: Int

    public init(error: String? = nil, axisNumber: Int = 0) {
        self.error = error
        self.axisNumber = axisNumber
    }
}
