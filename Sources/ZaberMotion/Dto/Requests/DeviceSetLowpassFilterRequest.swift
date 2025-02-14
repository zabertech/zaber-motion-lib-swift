/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct DeviceSetLowpassFilterRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var channelNumber: Int
    public var cutoffFrequency: Double
    public var unit: Units

    public init(interfaceId: Int = 0, device: Int = 0, channelNumber: Int = 0, cutoffFrequency: Double = 0.0, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.device = device
        self.channelNumber = channelNumber
        self.cutoffFrequency = cutoffFrequency
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceSetLowpassFilterRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceSetLowpassFilterRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceSetLowpassFilterRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceSetLowpassFilterRequest", error: error)
        }
    }
}
