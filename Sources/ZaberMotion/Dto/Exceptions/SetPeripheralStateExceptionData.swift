/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Contains additional data for a SetPeripheralStateFailedException.
 */
public struct SetPeripheralStateExceptionData: Serializable {

    /**
     * The number of axis where the exception originated.
     */
    public var axisNumber: Int

    /**
     * A list of settings which could not be set.
     */
    public var settings: [String]

    /**
     * The reason servo tuning could not be set.
     */
    public var servoTuning: String

    /**
     * The reasons stored positions could not be set.
     */
    public var storedPositions: [String]

    /**
     * The reasons storage could not be set.
     */
    public var storage: [String]

    public init(axisNumber: Int = 0, settings: [String] = [], servoTuning: String = "", storedPositions: [String] = [], storage: [String] = []) {
        self.axisNumber = axisNumber
        self.settings = settings
        self.servoTuning = servoTuning
        self.storedPositions = storedPositions
        self.storage = storage
    }

    public static func fromByteArray(_ byteArray: Data) throws -> SetPeripheralStateExceptionData {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(SetPeripheralStateExceptionData.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "SetPeripheralStateExceptionData", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "SetPeripheralStateExceptionData", error: error)
        }
    }
}
