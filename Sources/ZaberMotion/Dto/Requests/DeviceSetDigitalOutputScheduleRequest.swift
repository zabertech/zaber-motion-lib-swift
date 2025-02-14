/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii
import UnitsInternal


public struct DeviceSetDigitalOutputScheduleRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var channelNumber: Int
    public var value: DtoAscii.DigitalOutputAction
    public var futureValue: DtoAscii.DigitalOutputAction
    public var delay: Double
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, channelNumber: Int = 0, value: DtoAscii.DigitalOutputAction = DigitalOutputAction(rawValue: 0)!, futureValue: DtoAscii.DigitalOutputAction = DigitalOutputAction(rawValue: 0)!, delay: Double = 0.0, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.channelNumber = channelNumber
        self.value = value
        self.futureValue = futureValue
        self.delay = delay
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceSetDigitalOutputScheduleRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceSetDigitalOutputScheduleRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceSetDigitalOutputScheduleRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceSetDigitalOutputScheduleRequest", error: error)
        }
    }
}
