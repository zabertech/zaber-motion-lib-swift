/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct MicroscopeTriggerCameraRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var channelNumber: Int
    public var delay: Double
    public var unit: Units
    public var wait: Bool

    public init(interfaceId: Int = 0, device: Int = 0, channelNumber: Int = 0, delay: Double = 0.0, unit: Units = Units.native, wait: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.channelNumber = channelNumber
        self.delay = delay
        self.unit = unit
        self.wait = wait
    }

    public static func fromByteArray(_ byteArray: Data) throws -> MicroscopeTriggerCameraRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(MicroscopeTriggerCameraRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "MicroscopeTriggerCameraRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "MicroscopeTriggerCameraRequest", error: error)
        }
    }
}
