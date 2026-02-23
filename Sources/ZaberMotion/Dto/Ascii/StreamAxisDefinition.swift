/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

/**
 * Defines an axis of the stream.
 */
public struct StreamAxisDefinition: Serializable {

    /**
     * Number of a physical axis or a lockstep group.
     */
    public var axisNumber: Int

    /**
     * Defines the type of the axis.
     */
    public var axisType: StreamAxisType?

    public init(axisNumber: Int = 0, axisType: StreamAxisType? = nil) {
        self.axisNumber = axisNumber
        self.axisType = axisType
    }
}
