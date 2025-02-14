/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct TriggerFireWhenRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var triggerNumber: Int
    public var condition: String

    public init(interfaceId: Int = 0, device: Int = 0, triggerNumber: Int = 0, condition: String = "") {
        self.interfaceId = interfaceId
        self.device = device
        self.triggerNumber = triggerNumber
        self.condition = condition
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TriggerFireWhenRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TriggerFireWhenRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TriggerFireWhenRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TriggerFireWhenRequest", error: error)
        }
    }
}
