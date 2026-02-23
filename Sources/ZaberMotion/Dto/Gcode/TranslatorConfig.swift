/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

/**
 * Configuration of a translator.
 */
public struct TranslatorConfig: Serializable {

    /**
     * Optional custom mapping of translator axes to stream axes.
     */
    public var axisMappings: [AxisMapping]?

    /**
     * Optional transformation of axes.
     */
    public var axisTransformations: [AxisTransformation]?

    public init(axisMappings: [AxisMapping]? = nil, axisTransformations: [AxisTransformation]? = nil) {
        self.axisMappings = axisMappings
        self.axisTransformations = axisTransformations
    }
}
