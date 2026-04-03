// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import Dto


/**
 * Configuration representing a microscope setup.
 * Device address of value 0 means that the part is not present.
 */
public struct MicroscopeConfig: Serializable {

    /**
     * Focus axis of the microscope.
     */
    public var focusAxis: Dto.AxisAddress?

    /**
     * X axis of the microscope.
     */
    public var xAxis: Dto.AxisAddress?

    /**
     * Y axis of the microscope.
     */
    public var yAxis: Dto.AxisAddress?

    /**
     * Illuminator device address.
     */
    public var illuminator: Int?

    /**
     * Filter changer device address.
     */
    public var filterChanger: Int?

    /**
     * Objective changer device address.
     */
    public var objectiveChanger: Int?

    /**
     * Autofocus identifier.
     */
    public var autofocus: Int?

    /**
     * Camera trigger digital output address.
     */
    public var cameraTrigger: Dto.ChannelAddress?

    public init(focusAxis: Dto.AxisAddress? = nil, xAxis: Dto.AxisAddress? = nil, yAxis: Dto.AxisAddress? = nil, illuminator: Int? = nil, filterChanger: Int? = nil, objectiveChanger: Int? = nil, autofocus: Int? = nil, cameraTrigger: Dto.ChannelAddress? = nil) {
        self.focusAxis = focusAxis
        self.xAxis = xAxis
        self.yAxis = yAxis
        self.illuminator = illuminator
        self.filterChanger = filterChanger
        self.objectiveChanger = objectiveChanger
        self.autofocus = autofocus
        self.cameraTrigger = cameraTrigger
    }
}
