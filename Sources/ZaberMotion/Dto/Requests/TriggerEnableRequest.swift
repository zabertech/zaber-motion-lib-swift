/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct TriggerEnableRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var triggerNumber: Int
    public var count: Int

    public init(interfaceId: Int = 0, device: Int = 0, triggerNumber: Int = 0, count: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.triggerNumber = triggerNumber
        self.count = count
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TriggerEnableRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TriggerEnableRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TriggerEnableRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TriggerEnableRequest", error: error)
        }
    }
}
