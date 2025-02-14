/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct DeviceSetAllAnalogOutputsScheduleRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var values: [Double]
    public var futureValues: [Double]
    public var delay: Double
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, values: [Double] = [], futureValues: [Double] = [], delay: Double = 0.0, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.values = values
        self.futureValues = futureValues
        self.delay = delay
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceSetAllAnalogOutputsScheduleRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceSetAllAnalogOutputsScheduleRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceSetAllAnalogOutputsScheduleRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceSetAllAnalogOutputsScheduleRequest", error: error)
        }
    }
}
