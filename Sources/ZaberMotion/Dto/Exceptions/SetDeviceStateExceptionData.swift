/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Contains additional data for a SetDeviceStateFailedException.
 */
public struct SetDeviceStateExceptionData: Serializable {

    /**
     * A list of settings which could not be set.
     */
    public var settings: [String]

    /**
     * The reason the stream buffers could not be set.
     */
    public var streamBuffers: [String]

    /**
     * The reason the pvt buffers could not be set.
     */
    public var pvtBuffers: [String]

    /**
     * The reason the triggers could not be set.
     */
    public var triggers: [String]

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

    /**
     * Errors for any peripherals that could not be set.
     */
    public var peripherals: [SetPeripheralStateExceptionData]

    public init(settings: [String] = [], streamBuffers: [String] = [], pvtBuffers: [String] = [], triggers: [String] = [], servoTuning: String = "", storedPositions: [String] = [], storage: [String] = [], peripherals: [SetPeripheralStateExceptionData] = []) {
        self.settings = settings
        self.streamBuffers = streamBuffers
        self.pvtBuffers = pvtBuffers
        self.triggers = triggers
        self.servoTuning = servoTuning
        self.storedPositions = storedPositions
        self.storage = storage
        self.peripherals = peripherals
    }

    public static func fromByteArray(_ byteArray: Data) throws -> SetDeviceStateExceptionData {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(SetDeviceStateExceptionData.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "SetDeviceStateExceptionData", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "SetDeviceStateExceptionData", error: error)
        }
    }
}
