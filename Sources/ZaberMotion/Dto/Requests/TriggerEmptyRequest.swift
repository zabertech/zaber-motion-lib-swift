/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct TriggerEmptyRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var triggerNumber: Int

    public init(interfaceId: Int = 0, device: Int = 0, triggerNumber: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.triggerNumber = triggerNumber
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TriggerEmptyRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TriggerEmptyRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TriggerEmptyRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TriggerEmptyRequest", error: error)
        }
    }
}
