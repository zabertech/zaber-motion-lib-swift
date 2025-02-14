/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct TriggerFireWhenIoRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var triggerNumber: Int
    public var portType: DtoAscii.IoPortType
    public var channel: Int
    public var triggerCondition: DtoAscii.TriggerCondition
    public var value: Double

    public init(interfaceId: Int = 0, device: Int = 0, triggerNumber: Int = 0, portType: DtoAscii.IoPortType = IoPortType(rawValue: 0)!, channel: Int = 0, triggerCondition: DtoAscii.TriggerCondition = TriggerCondition(rawValue: 0)!, value: Double = 0.0) {
        self.interfaceId = interfaceId
        self.device = device
        self.triggerNumber = triggerNumber
        self.portType = portType
        self.channel = channel
        self.triggerCondition = triggerCondition
        self.value = value
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TriggerFireWhenIoRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TriggerFireWhenIoRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TriggerFireWhenIoRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TriggerFireWhenIoRequest", error: error)
        }
    }
}
