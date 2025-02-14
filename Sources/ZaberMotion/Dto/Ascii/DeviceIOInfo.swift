/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Class representing information on the I/O channels of the device.
 */
public struct DeviceIOInfo: Serializable {

    /**
     * Number of analog output channels.
     */
    public var numberAnalogOutputs: Int

    /**
     * Number of analog input channels.
     */
    public var numberAnalogInputs: Int

    /**
     * Number of digital output channels.
     */
    public var numberDigitalOutputs: Int

    /**
     * Number of digital input channels.
     */
    public var numberDigitalInputs: Int

    public init(numberAnalogOutputs: Int = 0, numberAnalogInputs: Int = 0, numberDigitalOutputs: Int = 0, numberDigitalInputs: Int = 0) {
        self.numberAnalogOutputs = numberAnalogOutputs
        self.numberAnalogInputs = numberAnalogInputs
        self.numberDigitalOutputs = numberDigitalOutputs
        self.numberDigitalInputs = numberDigitalInputs
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceIOInfo {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceIOInfo.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceIOInfo", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceIOInfo", error: error)
        }
    }
}
