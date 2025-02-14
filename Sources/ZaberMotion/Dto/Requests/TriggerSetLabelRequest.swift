/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct TriggerSetLabelRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var triggerNumber: Int
    public var label: String?

    public init(interfaceId: Int = 0, device: Int = 0, triggerNumber: Int = 0, label: String? = nil) {
        self.interfaceId = interfaceId
        self.device = device
        self.triggerNumber = triggerNumber
        self.label = label
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TriggerSetLabelRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TriggerSetLabelRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TriggerSetLabelRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TriggerSetLabelRequest", error: error)
        }
    }
}
