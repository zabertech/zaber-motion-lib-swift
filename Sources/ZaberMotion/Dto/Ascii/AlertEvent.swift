// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Alert message received from the device.
 */
public struct AlertEvent: Serializable {

    /**
     * Number of the device that sent the message.
     */
    public var deviceAddress: Int

    /**
     * Number of the axis which the response applies to. Zero denotes device scope.
     */
    public var axisNumber: Int

    /**
     * The device status contains BUSY when the axis is moving and IDLE otherwise.
     */
    public var status: String

    /**
     * The warning flag contains the highest priority warning currently active for the device or axis.
     */
    public var warningFlag: String

    /**
     * Response data which varies depending on the request.
     */
    public var data: String

    public init(deviceAddress: Int = 0, axisNumber: Int = 0, status: String = "", warningFlag: String = "", data: String = "") {
        self.deviceAddress = deviceAddress
        self.axisNumber = axisNumber
        self.status = status
        self.warningFlag = warningFlag
        self.data = data
    }
}
