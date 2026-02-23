/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

/**
 * Response message from the device.
 */
public struct Response: Serializable {

    /**
     * Number of the device that sent the message.
     */
    public var deviceAddress: Int

    /**
     * Number of the axis which the response applies to. Zero denotes device scope.
     */
    public var axisNumber: Int

    /**
     * The reply flag indicates if the request was accepted (OK) or rejected (RJ).
     * Does not apply to info messages.
     */
    public var replyFlag: String

    /**
     * The device status contains BUSY when the axis is moving and IDLE otherwise.
     * Does not apply to info messages.
     */
    public var status: String

    /**
     * The warning flag contains the highest priority warning currently active for the device or axis.
     * Does not apply to info messages.
     */
    public var warningFlag: String

    /**
     * Response data which varies depending on the request.
     */
    public var data: String

    /**
     * Type of the response received (only Reply or Info).
     */
    public var messageType: MessageType

    public init(deviceAddress: Int = 0, axisNumber: Int = 0, replyFlag: String = "", status: String = "", warningFlag: String = "", data: String = "", messageType: MessageType = MessageType(rawValue: 0)!) {
        self.deviceAddress = deviceAddress
        self.axisNumber = axisNumber
        self.replyFlag = replyFlag
        self.status = status
        self.warningFlag = warningFlag
        self.data = data
        self.messageType = messageType
    }
}
