/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii
import UnitsInternal


public struct DeviceSetAllDigitalOutputsScheduleRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var values: [DtoAscii.DigitalOutputAction]
    public var futureValues: [DtoAscii.DigitalOutputAction]
    public var delay: Double
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, values: [DtoAscii.DigitalOutputAction] = [], futureValues: [DtoAscii.DigitalOutputAction] = [], delay: Double = 0.0, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.values = values
        self.futureValues = futureValues
        self.delay = delay
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceSetAllDigitalOutputsScheduleRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceSetAllDigitalOutputsScheduleRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceSetAllDigitalOutputsScheduleRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceSetAllDigitalOutputsScheduleRequest", error: error)
        }
    }
}
