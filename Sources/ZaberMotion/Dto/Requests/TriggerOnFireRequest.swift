/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct TriggerOnFireRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var triggerNumber: Int
    public var action: DtoAscii.TriggerAction
    public var axis: Int
    public var command: String

    public init(interfaceId: Int = 0, device: Int = 0, triggerNumber: Int = 0, action: DtoAscii.TriggerAction = TriggerAction(rawValue: 0)!, axis: Int = 0, command: String = "") {
        self.interfaceId = interfaceId
        self.device = device
        self.triggerNumber = triggerNumber
        self.action = action
        self.axis = axis
        self.command = command
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TriggerOnFireRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TriggerOnFireRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TriggerOnFireRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TriggerOnFireRequest", error: error)
        }
    }
}
