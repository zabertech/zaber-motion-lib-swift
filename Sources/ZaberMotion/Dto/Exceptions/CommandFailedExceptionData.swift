/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Contains additional data for CommandFailedException.
 */
public struct CommandFailedExceptionData: Serializable {

    /**
     * The command that got rejected.
     */
    public var command: String

    /**
     * The data from the reply containing the rejection reason.
     */
    public var responseData: String

    /**
     * The flag indicating that the command was rejected.
     */
    public var replyFlag: String

    /**
     * The current device or axis status.
     */
    public var status: String

    /**
     * The highest priority warning flag on the device or axis.
     */
    public var warningFlag: String

    /**
     * The address of the device that rejected the command.
     */
    public var deviceAddress: Int

    /**
     * The number of the axis which the rejection relates to.
     */
    public var axisNumber: Int

    /**
     * The message ID of the reply.
     */
    public var id: Int

    public init(command: String = "", responseData: String = "", replyFlag: String = "", status: String = "", warningFlag: String = "", deviceAddress: Int = 0, axisNumber: Int = 0, id: Int = 0) {
        self.command = command
        self.responseData = responseData
        self.replyFlag = replyFlag
        self.status = status
        self.warningFlag = warningFlag
        self.deviceAddress = deviceAddress
        self.axisNumber = axisNumber
        self.id = id
    }

    public static func fromByteArray(_ byteArray: Data) throws -> CommandFailedExceptionData {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(CommandFailedExceptionData.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "CommandFailedExceptionData", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "CommandFailedExceptionData", error: error)
        }
    }
}
