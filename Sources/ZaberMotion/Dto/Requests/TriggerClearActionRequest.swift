/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct TriggerClearActionRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var triggerNumber: Int
    public var action: DtoAscii.TriggerAction

    public init(interfaceId: Int = 0, device: Int = 0, triggerNumber: Int = 0, action: DtoAscii.TriggerAction = TriggerAction(rawValue: 0)!) {
        self.interfaceId = interfaceId
        self.device = device
        self.triggerNumber = triggerNumber
        self.action = action
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TriggerClearActionRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TriggerClearActionRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TriggerClearActionRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TriggerClearActionRequest", error: error)
        }
    }
}
