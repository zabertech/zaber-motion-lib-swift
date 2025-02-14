/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Reply that could not be matched to a request.
 */
public struct UnknownResponseEvent: Serializable {

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
     */
    public var replyFlag: String

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

    /**
     * Type of the reply received.
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

    public static func fromByteArray(_ byteArray: Data) throws -> UnknownResponseEvent {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(UnknownResponseEvent.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "UnknownResponseEvent", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "UnknownResponseEvent", error: error)
        }
    }
}
